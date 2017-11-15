import django
from __builtin__ import str
from signal import alarm
django.setup()
from datetime import datetime
from django.core.exceptions import ObjectDoesNotExist
from pmc.models import *
from thread import *
import socket
import requests

port = 2020
s = socket.socket()
# s = socket(AF_INET, SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
host = socket.gethostname()
s.bind((host, port))
s.listen(5)

print 'Server listening....'

def faultsms(msg, alarm_obj):
    print "ok error msg"
    url = "http://sms.domainadda.com/vendorsms/pushsms.aspx?user=nimbrisk&password=technology@123&msisdn=91" + alarm_obj.number_1 + ",91" + alarm_obj.number_2 + ",91" + alarm_obj.number_3 + ",91" + alarm_obj.number_4 + ",91" + alarm_obj.number_5 + ",91" + ",91" + alarm_obj.number_6 + "&sid=JITOPC&msg=" + msg + "&fl=0&gwid=2"
    # url = "http://sms.domainadda.com/vendorsms/pushsms.aspx?user=krishiex&password=krishiex@123&msisdn=91" + alarm_obj.number_1 + ",91" + alarm_obj.number_2 + ",91" + alarm_obj.number_3 + ",91" + alarm_obj.number_4 + ",91" + alarm_obj.number_5 + ",91" + ",91" + alarm_obj.number_6 + "&sid=KRISHI&msg=" + msg + "&fl=0&gwid=2"
    res = requests.get(url)

def clientthread(conn):
    while True:
        print 'Got connection from', addr
        if SendToClient.objects.filter(is_send=False):
                now = datetime.now()
                hour = str(now.hour) if len(str(now.hour)) == 2 else "0" + str(now.hour)
                minute = str(now.minute) if len(str(now.minute)) == 2 else "0" + str(now.minute)
                day = str(now.day) if len(str(now.day)) == 2 else "0" + str(now.day)
                month = str(now.month) if len(str(now.month)) == 2 else "0" + str(now.month)
                for send_obj in SendToClient.objects.filter(is_send=False):
                    data = '$%*$[}$#K$'
                    data += str(send_obj.feeder.feeder_name) + "$" + day + "$" + month + "$" + hour + "$" + minute + "$" + str(send_obj.mode) + "$" + str(send_obj.output_code) + "$" + str(send_obj.update_time) + "$" + str(send_obj.feeder.rct_ratio) + "$" + str(send_obj.feeder.yct_ratio) + "$" + str(send_obj.feeder.bct_ratio) + "$" + str(send_obj.feeder.r_volt_ul) + "$" + str(send_obj.feeder.r_volt_ll) + "$" + str(send_obj.feeder.r_current_ul) + "$" + str(send_obj.feeder.r_current_ll) + "$" + str(send_obj.feeder.y_volt_ul) + "$" + str(send_obj.feeder.y_volt_ll) + "$" + str(send_obj.feeder.y_current_ul) + "$" + str(send_obj.feeder.y_current_ll) + "$" + str(send_obj.feeder.b_volt_ul) + "$" + str(send_obj.feeder.b_volt_ll) + "$" + str(send_obj.feeder.b_current_ul) + "$" + str(send_obj.feeder.b_current_ll) + "$" + "55$FTP$" + str(send_obj.feeder.feeder_name) + ".prog$#K${]$%*$"
                    print(data)
                    conn.send(data)
                    send_obj.is_send = True
                    send_obj.save()

        file_data = ''
        conn.settimeout(3.0)

        try:
          data1 = conn.recv(1024)
          file_data = file_data + str(data1)
          # data2 = conn.recv(1024)
          # file_data = file_data + str(data2)
          file_data = file_data.strip()
          file_list = file_data.split('&')
          print file_list
          if file_data != '':
              if file_data.startswith("&@!&?Z&NT&") and file_data[-10:] == "&NT&@!&?Z&":
                    automode = False if str(file_list[11]) == 'OFF' else True
                    manmode = False if str(file_list[12]) == 'OFF' else True
                    rvf = False if str(file_list[51]) == 'NOK' else True
                    rcf = False if str(file_list[52]) == 'NOK' else True
                    rff = False if str(file_list[53]) == 'NOK' else True
                    yvf = False if str(file_list[54]) == 'NOK' else True
                    ycf = False if str(file_list[55]) == 'NOK' else True
                    yff = False if str(file_list[56]) == 'NOK' else True
                    bvf = False if str(file_list[57]) == 'NOK' else True
                    bcf = False if str(file_list[58]) == 'NOK' else True
                    bff = False if str(file_list[59]) == 'NOK' else True
                    dof = False if str(file_list[60]) == 'NOK' else True
                    if rvf == False or yvf == False or bvf == False:
                        alarm_obj = Alarm.objects.get(feeder__feeder_name=str(file_list[4]), fault_type="Voltage(R,Y,B)")
                        if alarm_obj.fault_occur:
                          pass
                        else:
                          alarm_obj.fault_occur = True
                          alarm_obj.save()
                          message = str(file_list[4]) + " Voltage(R,Y,B) Voltage out of limit"
                          faultsms(message, alarm_obj)
                    if rcf == False or ycf == False or bcf == False:
                        alarm_obj = Alarm.objects.get(feeder__feeder_name=str(file_list[4]), fault_type="Current(R,Y,B)")
                        if alarm_obj.fault_occur:
                          pass
                        else:
                          alarm_obj.fault_occur = True
                          alarm_obj.save()
                          message = str(file_list[4]) + " Current(R,Y,B) Current out of limit"
                          faultsms(message, alarm_obj)
                    if rff == False or yff == False or bff == False:
                        alarm_obj = Alarm.objects.get(feeder__feeder_name=str(file_list[4]), fault_type="Fuse(R,Y,B)")
                        if alarm_obj.fault_occur:
                          pass
                        else:
                          alarm_obj.fault_occur = True
                          alarm_obj.save()
                          message = str(file_list[4]) + " Fuse(R,Y,B) Fuse Blown"
                          faultsms(message, alarm_obj)
                    if dof == False:
                        alarm_obj = Alarm.objects.get(feeder__feeder_name=str(file_list[4]), fault_type="Open Door Fault")
                        if alarm_obj.fault_occur:
                          pass
                        else:
                          alarm_obj.fault_occur = True
                          alarm_obj.save()
                          message = str(file_list[4]) + " Open Door Fault. Door is Open"
                          faultsms(message, alarm_obj)

                    dt = str(file_list[15]) + "-" + str(file_list[14]) + "-" + str(file_list[13]) + " " + str(file_list[16]) + ":" + str(file_list[17]) + ":00"
                    datefiled = datetime.strptime(dt, '%y-%m-%d %H:%M:%S')
                    Feederdata.objects.create(feeder=Feeder.objects.get(feeder_name=str(file_list[4])), twlon_time=str(file_list[7]),
                                              dimon_time=str(file_list[8]), dimoff_time=str(file_list[9]), twloff_time=str(file_list[10]),
                                              auto_mode=automode, man_mode=manmode, date_filed=datefiled, lp_off1=str(file_list[18]),
                                              lp_on1=str(file_list[19]), lp_off2=str(file_list[20]), lp_on2=str(file_list[21]),
                                              r_voltage=str(file_list[22]), r_current=str(file_list[23]), r_frequency=str(file_list[24]),
                                              r_pf=str(file_list[25]), r_ap=str(file_list[26]), r_app=str(file_list[27]),
                                              r_ph_rotio=str(file_list[28]), r_on=str(file_list[29]), r_off=str(file_list[30]),
                                              y_voltage=str(file_list[31]), y_current=str(file_list[32]), y_frequency=str(file_list[33]),
                                              y_pf=str(file_list[34]), y_ap=str(file_list[35]), y_app=str(file_list[36]),
                                              y_ph_rotio=str(file_list[37]), y_on=str(file_list[38]), y_off=str(file_list[39]),
                                              b_voltage=str(file_list[40]), b_current=str(file_list[41]), b_frequency=str(file_list[42]),
                                              b_pf=str(file_list[43]), b_ap=str(file_list[44]), b_app=str(file_list[45]),
                                              b_ph_rotio=str(file_list[46]), b_on=str(file_list[47]), b_off=str(file_list[48]),
                                              meter_kwh=str(file_list[49]), meter_kva=str(file_list[50]), r_vf=rvf, r_cf=rcf, r_ff=rff,
                                              y_vf=yvf, y_cf=ycf, y_ff=yff, b_vf=bvf, b_cf=bcf, b_ff=bff, dof=dof,
                                              dimming_percent=str(file_list[61]), signal_strength=str(file_list[62]))
              else:
                  ErrorLog.objects.create(error_data=file_data)
                  print "Add in error log"

          else:
              print "Add that in error log"
        except:
              continue

while True:
# Accepting incoming connections
    conn, addr = s.accept()
    start_new_thread(clientthread, (conn,))
    print('Done sending')
conn.close()
s.close()
