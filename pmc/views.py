# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse, response
from django.contrib.auth import logout
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django_ajax.decorators import ajax
from pmc.models import *
from django.core.exceptions import ObjectDoesNotExist
from django.template.context_processors import request
from django.views.decorators.csrf import csrf_exempt
from signal import signal
from pmc.models import Feederdata
from django.views.static import serve
from os.path import dirname
import os
from datetime import datetime, timedelta



# Create your views here.
def assure_path_exists(path):
    dir = os.path.dirname(path)
    if not os.path.exists(dir):
            os.makedirs(dir)


def get_data(feeder_obj):
    response = []
    for feederdata in feeder_obj:
        feeder_dict = {}
        feeder_dict['id'] = str(feederdata.id)
        feeder_dict['feeder_name'] = str(feederdata.feeder.feeder_name)
        feeder_dict['lat'] = str(feederdata.feeder.latitude)
        feeder_dict['long'] = str(feederdata.feeder.longitude)
        feeder_dict['twlon_time'] = str(feederdata.twlon_time)
        feeder_dict['dimon_time'] = str(feederdata.dimon_time)
        feeder_dict['dimoff_time'] = str(feederdata.dimoff_time)
        feeder_dict['twloff_time'] = str(feederdata.twloff_time)
        feeder_dict['auto_mode'] = feederdata.auto_mode
        feeder_dict['man_mode'] = feederdata.man_mode
        feeder_dict['date_filed'] = (feederdata.date_filed).strftime('%d/%m/%Y %H:%M')
        feeder_dict['lp_on1'] = feederdata.lp_on1
        feeder_dict['lp_off1'] = feederdata.lp_off1
        feeder_dict['r_voltage'] = feederdata.r_voltage
        feeder_dict['r_current'] = feederdata.r_current
        feeder_dict['r_frequency'] = feederdata.r_frequency
        feeder_dict['r_pf'] = feederdata.r_pf
        feeder_dict['r_ap'] = feederdata.r_ap
        feeder_dict['r_app'] = feederdata.r_app
        feeder_dict['r_ph_rotio'] = feederdata.r_ph_rotio
        feeder_dict['r_on'] = feederdata.r_on
        feeder_dict['r_off'] = feederdata.r_off
        feeder_dict['r_vf'] = feederdata.r_vf
        feeder_dict['r_cf'] = feederdata.r_cf
        feeder_dict['r_ff'] = feederdata.r_ff
        feeder_dict['y_voltage'] = feederdata.y_voltage
        feeder_dict['y_current'] = feederdata.y_current
        feeder_dict['y_frequency'] = feederdata.y_frequency
        feeder_dict['y_pf'] = feederdata.y_pf
        feeder_dict['y_ap'] = feederdata.y_ap
        feeder_dict['y_app'] = feederdata.y_app
        feeder_dict['y_ph_rotio'] = feederdata.y_ph_rotio
        feeder_dict['y_on'] = feederdata.y_on
        feeder_dict['y_off'] = feederdata.y_off
        feeder_dict['y_vf'] = feederdata.y_vf
        feeder_dict['y_cf'] = feederdata.y_cf
        feeder_dict['y_ff'] = feederdata.y_ff
        feeder_dict['b_voltage'] = feederdata.b_voltage
        feeder_dict['b_current'] = feederdata.b_current
        feeder_dict['b_frequency'] = feederdata.b_frequency
        feeder_dict['b_pf'] = feederdata.b_pf
        feeder_dict['b_ap'] = feederdata.b_ap
        feeder_dict['b_app'] = feederdata.b_app
        feeder_dict['b_ph_rotio'] = feederdata.b_ph_rotio
        feeder_dict['b_on'] = feederdata.b_on
        feeder_dict['b_off'] = feederdata.b_off
        feeder_dict['b_vf'] = feederdata.b_vf
        feeder_dict['b_cf'] = feederdata.b_cf
        feeder_dict['b_ff'] = feederdata.b_ff
        feeder_dict['dof'] = feederdata.dof
        feeder_dict['meter_kva'] = feederdata.meter_kva
        feeder_dict['meter_kwh'] = feederdata.meter_kwh
        feeder_dict['dimming_percent'] = feederdata.dimming_percent
        feeder_dict['signal_strength'] = str(feederdata.signal_strength)
        # if feederdata.signal_strength == 0:
        #     feeder_dict['signal_strength'] = "No Signal"
        # elif feederdata.signal_strength == 25:
        #     feeder_dict['signal_strength'] = "Weak"
        # elif feederdata.signal_strength == 75:
        #     feeder_dict['signal_strength'] = "Good"
        # elif feederdata.signal_strength == 100:
        #     feeder_dict['signal_strength'] = "Strong"
        response.append(feeder_dict)
    return response

#     return [{
#                 'id': str(feederdata.id),
#                 'feeder_name': str(feederdata.feeder.feeder_name),
#                 'lat': str(feederdata.feeder.latitude),
#                 'long': str(feederdata.feeder.longitude),
#                 'twlon_time': str(feederdata.twlon_time),
#                 'dimon_time': str(feederdata.dimon_time),
#                 'dimoff_time': str(feederdata.dimoff_time),
#                 'twloff_time': str(feederdata.twloff_time),
#                 'auto_mode': feederdata.auto_mode,
#                 'man_mode': feederdata.man_mode,
#                 'date_filed': (feederdata.date_filed).strftime('%d/%m/%Y %H:%M'),
#                 'lp_on1': feederdata.lp_on1,
#                 'lp_off1': feederdata.lp_off1,
#                 'r_voltage': feederdata.r_voltage,
#                 'r_current': feederdata.r_current,
#                 'r_frequency': feederdata.r_frequency,
#                 'r_pf': feederdata.r_pf,
#                 'r_ap': feederdata.r_ap,
#                 'r_app': feederdata.r_app,
#                 'r_ph_rotio': feederdata.r_ph_rotio,
#                 'r_on': feederdata.r_on,
#                 'r_off': feederdata.r_off,
#                 'r_vf': feederdata.r_vf,
#                 'r_cf': feederdata.r_cf,
#                 'r_ff': feederdata.r_ff,
#                 'y_voltage': feederdata.y_voltage,
#                 'y_current': feederdata.y_current,
#                 'y_frequency': feederdata.y_frequency,
#                 'y_pf': feederdata.y_pf,
#                 'y_ap': feederdata.y_ap,
#                 'y_app': feederdata.y_app,
#                 'y_ph_rotio': feederdata.y_ph_rotio,
#                 'y_on': feederdata.y_on,
#                 'y_off': feederdata.y_off,
#                 'y_vf': feederdata.y_vf,
#                 'y_cf': feederdata.y_cf,
#                 'y_ff': feederdata.y_ff,
#                 'b_voltage': feederdata.b_voltage,
#                 'b_current': feederdata.b_current,
#                 'b_frequency': feederdata.b_frequency,
#                 'b_pf': feederdata.b_pf,
#                 'b_ap': feederdata.b_ap,
#                 'b_app': feederdata.b_app,
#                 'b_ph_rotio': feederdata.b_ph_rotio,
#                 'b_on': feederdata.b_on,
#                 'b_off': feederdata.b_off,
#                 'b_vf': feederdata.b_vf,
#                 'b_cf': feederdata.b_cf,
#                 'b_ff': feederdata.b_ff,
#                 'dof': feederdata.dof,
#                 'meter_kva': feederdata.meter_kva,
#                 'meter_kwh': feederdata.meter_kwh,
#                 'dimming_percent': feederdata.dimming_percent
#         }for feederdata in feeder_obj]

def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect('/')
            else:
                return HttpResponse('Your account is disabled.')
        else:
            print 'Invalid login details: {0}, {1}'.format(username,
                    password)
            return HttpResponseRedirect('/login/')
    else:
    	return render(request, 'registration/login.html', {})
        # return render_to_response('registration/login.html')

@login_required(login_url="/login/")
def user_logout(request):
    logout(request)
    return HttpResponseRedirect('/login/')

@login_required(login_url="/login/")
def home(request):
       
       is_admin = request.user.groups.filter(name='pmcadmin').exists()
       return render_to_response("index.html", locals(), RequestContext(request))
   

@login_required(login_url="/login/")
def monitor(request):
       is_admin = request.user.groups.filter(name='pmcadmin').exists()
       return render_to_response("monitor.html", locals(), RequestContext(request))

@login_required(login_url="/login/")
def userdata(request):
       is_admin = request.user.groups.filter(name='pmcadmin').exists()
       return render_to_response("userdata.html", locals(), RequestContext(request))
   
@login_required(login_url='/login/')
@ajax
def division(request):
    if request.method == 'GET':
        division = request.GET.get('term')
        if division:
            divisions = Division.objects.filter(is_active=True, division_name__istartswith=str(division)
                ).values_list('division_name', flat=True)
        else:
            divisions = []

        return list(set(divisions))

@login_required(login_url='/login/')
@ajax
def sub_division(request):
    if request.method == 'GET':
        division = request.GET.get('division')
        sub_division = request.GET.get('term')
        if division and sub_division:
            subdivisions = Subdivision.objects.filter(is_active=True,
                division__division_name=str(division),
                subdivision_name__istartswith=str(sub_division)).values_list('subdivision_name', flat=True)
        else:
            subdivisions = []

        return list(set(subdivisions))

@login_required(login_url='/login/')
@ajax
def feeder(request):
    if request.method == 'GET':
        subdiv = request.GET.get('subdiv')
        div = request.GET.get('division')
        feeder_name = request.GET.get('term')
        if div and subdiv and feeder_name:
            feeders = Feeder.objects.filter(is_active=True,
                subdivision__division__division_name=str(div),
                subdivision__subdivision_name=str(subdiv),
                feeder_name__istartswith=str(feeder_name)).values_list('feeder_name', flat=True)
        else:
            feeders = []

        return list(set(feeders))

@login_required(login_url='/login/')
@ajax
def only_feeder(request):
    if request.method == 'GET':
        feeder = request.GET.get('term')
        if feeder:
            feeders = Feeder.objects.filter(is_active=True, feeder_name__istartswith=str(feeder)
                ).values_list('feeder_name', flat=True)
        else:
            feeders = []

        return list(set(feeders))


@login_required(login_url='/login/')
@ajax
def feeder_info(request):
    if request.method == 'GET':
        feeder = Feeder.objects.get(feeder_name=str(request.GET.get('feeder_name')))
        return {
                    'feeder_id': str(feeder.id),
                    'feeder_name': str(feeder.feeder_name),
                    'subdiv_name': str(feeder.subdivision.subdivision_name),
                    'div_name': str(feeder.subdivision.division.division_name),
                    'latitude': str(feeder.latitude),
                    'longitude': str(feeder.longitude),
                    'rct_ratio': str(feeder.rct_ratio),
                    'yct_ratio': str(feeder.yct_ratio),
                    'bct_ratio': str(feeder.bct_ratio),
                    'r_volt_ul': str(feeder.r_volt_ul),
                    'r_volt_ll': str(feeder.r_volt_ll),
                    'r_current_ul': str(feeder.r_current_ul),
                    'r_current_ll': str(feeder.r_current_ll),
                    'y_volt_ul': str(feeder.y_volt_ul),
                    'y_volt_ll': str(feeder.y_volt_ll),
                    'y_current_ul': str(feeder.y_current_ul),
                    'y_current_ll': str(feeder.y_current_ll),
                    'b_volt_ul': str(feeder.b_volt_ul),
                    'b_volt_ll': str(feeder.b_volt_ll),
                    'b_current_ul': str(feeder.b_current_ul),
                    'b_current_ll': str(feeder.b_current_ll),
                } 

@login_required(login_url='/login/')
def logs(request):
        is_admin = request.user.groups.filter(name='pmcadmin').exists()
        return render_to_response("logs.html", locals(), RequestContext(request))

@login_required(login_url='/login/')
def configure(request):
        is_admin = request.user.groups.filter(name='pmcadmin').exists()
        return render_to_response("configure.html", locals(), RequestContext(request))

@login_required(login_url='/login/')
def alarm(request):
        is_admin = request.user.groups.filter(name='pmcadmin').exists()
        return render_to_response("alarm.html", locals(), RequestContext(request))

@login_required(login_url='/login/')
def view_all(request):
        is_admin = request.user.groups.filter(name='pmcadmin').exists()
        return render_to_response("view_all.html", locals(), RequestContext(request))

@login_required(login_url='/login/')
def control(request):
        is_admin = request.user.groups.filter(name='pmcadmin').exists()
        return render_to_response("control.html", locals(), RequestContext(request))


@ajax
def feeder_data(request):
    if request.method == 'GET':

        feeder_id = str(request.GET.get('feeder_id'))
        subdiv_id = str(request.GET.get('subdivision_id'))
        div_id = str(request.GET.get('div_id'))
        from_date = str(request.GET.get('from_date'))
        to_date = str(request.GET.get('to_date'))
        if int(request.GET.get('type')) == 1:
            feeder_obj = [Feederdata.objects.filter(feeder__feeder_name=feeder_id, is_active=True).latest('id')]
            return get_data(feeder_obj)
        elif int(request.GET.get('type')) == 2:
            feeder_obj = Feederdata.objects.filter(feeder__feeder_name=feeder_id, is_active=True)[::-1][:25]
            return get_data(feeder_obj)
        else:
            feeder_obj = Feederdata.objects.filter(feeder__feeder_name=feeder_id,created_on__range=[from_date,to_date], is_active=True)
            return get_data(feeder_obj)
            

@ajax
def all_feeder_data(request):
    if request.method == 'GET':
        response_data = request.GET.dict()
        response = []
        if str(response_data.get('type')) == '1':
            feeder_objs = Feeder.objects.filter(is_active=True)
        else:  
            feeder_objs = Feeder.objects.filter(subdivision__division__division_name=str(response_data.get('div_name')), is_active=True)
        for feeder in feeder_objs:
            feeder_dict = {}
            feeder_dict['feeder_name'] = str(feeder.feeder_name).title()
            feeder_dict['lat'] = str(feeder.latitude)
            feeder_dict['long'] = str(feeder.longitude)
            if Feederdata.objects.filter(feeder=feeder).exists():
                feeder_obj = Feederdata.objects.filter(feeder=feeder, is_active=True).latest('id')
                feeder_dict['date_filed'] = (feeder_obj.date_filed).strftime('%d/%m/%Y %H:%M')
                feeder_dict['r_ff'] = "OK" if feeder_obj.r_ff else "Blown"
                feeder_dict['y_ff'] = "OK" if feeder_obj.y_ff else "Blown"
                feeder_dict['b_ff'] = "OK" if feeder_obj.b_ff else "Blown"
                feeder_dict['last_power_on'] = str(feeder_obj.lp_on1)
                feeder_dict['last_power_off'] = str(feeder_obj.lp_off1)
                feeder_dict['kwh'] = str(feeder_obj.meter_kwh)
                feeder_dict['kva'] = str(feeder_obj.meter_kva)
                feeder_dict['signal_strength'] = str(feeder_obj.signal_strength)
                # if signal_strength == 0:
                #     feeder_dict['signal_strength'] = "No Signal"
                # elif signal_strength == 25:
                #     feeder_dict['signal_strength'] = "Weak"
                # elif signal_strength == 75:
                #     feeder_dict['signal_strength'] = "Good"
                # elif signal_strength == 100:
                #     feeder_dict['signal_strength'] = "Strong"

                feeder_dict['dof'] = "CLOSED" if feeder_obj.dof else "OPEN"
                response.append(feeder_dict)
            else:
                continue
        return response

@ajax
def feeder_settings(request):
    response = []
    if request.method == 'GET':
        return [{
            'feed_id': str(feed.id),
            'feeder_name': str(feed.feeder_name)
        } for feed in Feeder.objects.filter(subdivision__division__division_name=str(request.GET.get('division_name')))]
        # feed = Feeder.objects.filter(subdivision__division__division_name=str(request.GET.get('division_name')))
        # for f in feed:
        #     feed_dict={}
        #     feed_dict['feeder_name'] = str(f.feeder_name)
        #     response.append(feed_dict) 
        # return response

@login_required(login_url='/login/')
@csrf_exempt
@ajax
def post_data(request):
    if request.method == 'POST':
        response_data = request.POST.dict()
        try:
            subdiv_obj = Subdivision.objects.get(subdivision_name=response_data.get('subdiv_name'), is_active=True)
            if response_data.get('feederid') != 'No Id':
                Feeder.objects.filter(id=int(response_data.get('feederid'))).update(subdivision=subdiv_obj, feeder_name=str(response_data.get('feeder_name')),
                        latitude=str(response_data.get('latitude')), longitude=str(response_data.get('longitude')),
                        rct_ratio=str(response_data.get('rph')), r_volt_ul=str(response_data.get('r_vol_ul')),
                        r_volt_ll=str(response_data.get('r_vol_ll')), r_current_ul=str(response_data.get('r_curr_ul')),
                        r_current_ll=str(response_data.get('r_curr_ll')),
                        yct_ratio=str(response_data.get('yph')), y_volt_ul=str(response_data.get('y_vol_ul')),
                        y_volt_ll=str(response_data.get('y_vol_ll')), y_current_ul=str(response_data.get('y_curr_ul')),
                        y_current_ll=str(response_data.get('y_curr_ll')), bct_ratio=str(response_data.get('bph')),
                        b_volt_ul=str(response_data.get('b_vol_ul')), b_volt_ll=str(response_data.get('b_vol_ll')),
                        b_current_ul=str(response_data.get('b_curr_ul')), b_current_ll=str(response_data.get('b_curr_ll')),
                        created_by=str(request.user), modified_by=str(request.user))
                return {"responseCode":200,
                        "Message":"""Feeder Successfully Updated."""}
            else:
                if Feeder.objects.filter(feeder_name=response_data.get('feeder_name')).exists():
                    return {"responseCode":400,
                        "Message":"""Feeder allready present"""}
                else:
                    feeder_obj = Feeder.objects.create(subdivision=subdiv_obj, feeder_name=str(response_data.get('feeder_name')),
                        latitude=str(response_data.get('latitude')), longitude=str(response_data.get('longitude')),
                        rct_ratio=str(response_data.get('rph')), r_volt_ul=str(response_data.get('r_vol_ul')),
                        r_volt_ll=str(response_data.get('r_vol_ll')), r_current_ul=str(response_data.get('r_curr_ul')),
                        r_current_ll=str(response_data.get('r_curr_ll')),
                        yct_ratio=str(response_data.get('yph')), y_volt_ul=str(response_data.get('y_vol_ul')),
                        y_volt_ll=str(response_data.get('y_vol_ll')), y_current_ul=str(response_data.get('y_curr_ul')),
                        y_current_ll=str(response_data.get('y_curr_ll')), bct_ratio=str(response_data.get('bph')),
                        b_volt_ul=str(response_data.get('b_vol_ul')), b_volt_ll=str(response_data.get('b_vol_ll')),
                        b_current_ul=str(response_data.get('b_curr_ul')), b_current_ll=str(response_data.get('b_curr_ll')),
                        created_by=str(request.user), modified_by=str(request.user))
                    Alarm.objects.create(feeder=feeder_obj, fault_type="Voltage(R,Y,B)")
                    Alarm.objects.create(feeder=feeder_obj, fault_type="Current(R,Y,B)")
                    Alarm.objects.create(feeder=feeder_obj, fault_type="Fuse(R,Y,B)")
                    Alarm.objects.create(feeder=feeder_obj, fault_type="Open Door Fault")
                    return {"responseCode":200,
                        "Message":"""Feeder Successfully added."""}
        except:
            return {"responseCode":400,
                    "Message":"""Something went wrong"""}

@login_required(login_url='/login/')
@csrf_exempt
@ajax
def post_division(request):
    if request.method == 'POST':
        response_data = request.POST.dict()
        print(response_data)
        try:
            if Division.objects.filter(division_name=response_data.get('division_name')).exists():
                return {"responseCode":400,
                    "Message":"""Division allready present"""}
            else:
                Division.objects.get_or_create(division_name=response_data.get('division_name'),
                    created_by=request.user, modified_by=request.user)
                return {"responseCode":200,
                    "Message":"""Division Successfully added."""}
        except:
            return {"responseCode":400,
                    "Message":"""Something went wrong"""}

@login_required(login_url='/login/')
@csrf_exempt
@ajax
def post_subdivision(request):
    if request.method == 'POST':
        response_data = request.POST.dict()
        try:
            if Subdivision.objects.filter(subdivision_name=response_data.get('subdivision_name')).exists():
                return {"responseCode":400,
                    "Message":"""Sub-Division allready present"""}
            else:
                division_obj = Division.objects.get(division_name=response_data.get('division_name'))
                Subdivision.objects.get_or_create(division=division_obj, subdivision_name=response_data.get('subdivision_name'),
                    created_by=request.user, modified_by=request.user)
                return {"responseCode":200,
                    "Message":"""Sub-Division Successfully added."""}
        except:
            return {"responseCode":400,
                    "Message":"""Something went wrong"""}

@login_required(login_url='/login/')
@csrf_exempt
@ajax
def edit_alarmdata(request):
        try:
            response_data = request.POST.dict()
            alarm_obj = Alarm.objects.get(id=int(response_data.get('alarm_id')))
            alarm_obj.number_1 = str(response_data.get('cont_1'))
            alarm_obj.number_2 = str(response_data.get('cont_2'))
            alarm_obj.number_3 = str(response_data.get('cont_3'))
            alarm_obj.number_4 = str(response_data.get('cont_4'))
            alarm_obj.number_5 = str(response_data.get('cont_5'))
            alarm_obj.number_6 = str(response_data.get('cont_6'))
            alarm_obj.save()
            return "Contact Successfully Updated."
        except  ObjectDoesNotExist:
            return
            {
                'errorCode': 503,
                'errorMessage': "Contact not found"
            }

@login_required(login_url='/login/')
@csrf_exempt
@ajax
def edit_faulterror(request):
        try:
            response_data = request.POST.dict()
            Alarm.objects.filter(id=int(response_data.get('alarm_id'))).update(fault_occur=False)
            return "Alert Updated"
        except  ObjectDoesNotExist:
            return
            {
                'errorCode': 503,
                'errorMessage': "Contact not found"
            }

@login_required(login_url='/login/')
def download_errorlog(request):
    UPLOAD_FOLDER = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'Documents')
    filename = "log"
    path = os.path.join(UPLOAD_FOLDER, filename)
    assure_path_exists(path)
    file = open(path, 'w')
    error_obj = ErrorLog.objects.all()
    for error in error_obj:
        file.write((error.created_on).strftime("%Y-%m-%d %H:%M") + "\n")
        file.write(str(error.error_data) + "\n\n\n")
    file.close()
    return serve(request, os.path.basename(path), os.path.dirname(path))


@login_required(login_url='/login/')
@ajax
def all_division(request):
    return [{"name": division.division_name,
                "id": division.id,
                }for division in Division.objects.filter(is_active=True)]


@login_required(login_url='/login/')
@ajax
def all_subdivision(request):
    return [{"name": subdivision.subdivision_name,
                "id": subdivision.id,
            }for subdivision in Subdivision.objects.filter(division__division_name__in =request.GET.getlist('division_id[]') , is_active=True)]

@login_required(login_url='/login/')
@ajax
def get_fault_list(request):
    return [{"feeder_name": str(fault.feeder.feeder_name),
             "id": str(fault.id),
             "fault_time": fault.modified_on.strftime("%d %b %y %H:%M"),
             "fault_type": str(fault.fault_type)
            }for fault in Alarm.objects.filter(fault_occur=True)]