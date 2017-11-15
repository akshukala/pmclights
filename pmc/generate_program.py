from pmc.models import *
from django.template.context_processors import request
from django.views.decorators.csrf import csrf_exempt
from django_ajax.decorators import ajax
from django.shortcuts import render
from django.shortcuts import render_to_response
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
from django.views.static import serve
import os
from datetime import datetime
from os.path import dirname
from signal import signal
from pmc.models import *

def assure_path_exists(path):
    dir = os.path.dirname(path)
    if not os.path.exists(dir):
            os.makedirs(dir)


@login_required(login_url='/login/')
@csrf_exempt
@ajax
def generate_prog(request):
    if request.method == 'POST':
        response_data = request.POST.dict()
        print response_data
        try:
            SendToClient.objects.create(feeder=Feeder.objects.get(id=int(response_data.get('feeder_id'))),
                                        mode=str(response_data.get('mode')),
                                        output_code=str(response_data.get('output')),
                                        update_time=str(response_data.get('out_time')))
            return {"responseCode":200,
                    "Message":"""Data sent to server  Successfully."""}
        except:
            return {"responseCode":400,
                    "Message":"""Data can't send to server"""}



# @login_required(login_url='/login/')
# def generate_prog(request):
# 	# UPLOAD_FOLDER = os.path.join(dirname(app.root_dir), 'Documents')
# 	UPLOAD_FOLDER = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'Documents')
# 	feeder = request.GET.get('hidden_feeder')
# 	feeder_obj = Feeder.objects.get(id=int(feeder))
# 	filename = str(feeder_obj.feeder_name) + ".prog"
# 	path = os.path.join(UPLOAD_FOLDER, filename)
# 	assure_path_exists(path)
# 	
# 	now = datetime.now()
# 	file = open(path, 'w') 
# 	file.write("!EF\n")
# 	file.write("!CD\n")
# 	file.write("!AB\n")
# 	file.write("!" + str(feeder_obj.feeder_name) + "\n") 
# 	file.write("!" + str(now.day) + "\n") 
# 	file.write("!" + str(now.month) + "\n") 
# 	file.write("!" + str(now.hour) + "\n")
# 	file.write("!" + str(now.minute) + "\n")
# 	file.write("!" + str(request.GET.get('mode')) + "\n")
# 	file.write("!" + str(request.GET.get('output_code')) + "\n")
# 	file.write("!updatetime\n")
# 	file.write("!" + str(feeder_obj.rct_ratio) + "\n")
# 	file.write("!" + str(feeder_obj.yct_ratio) + "\n")
# 	file.write("!" + str(feeder_obj.bct_ratio) + "\n")
# 	file.write("!" + str(feeder_obj.r_volt_ul) + "\n")
# 	file.write("!" + str(feeder_obj.r_volt_ll) + "\n")
# 	file.write("!" + str(feeder_obj.r_current_ul) + "\n")
# 	file.write("!" + str(feeder_obj.r_current_ll) + "\n")
# 	file.write("!" + str(feeder_obj.y_volt_ul) + "\n")
# 	file.write("!" + str(feeder_obj.y_volt_ll) + "\n")
# 	file.write("!" + str(feeder_obj.y_current_ul) + "\n")
# 	file.write("!" + str(feeder_obj.y_current_ll) + "\n")
# 	file.write("!" + str(feeder_obj.b_volt_ul) + "\n")
# 	file.write("!" + str(feeder_obj.b_volt_ll) + "\n")
# 	file.write("!" + str(feeder_obj.b_current_ul) + "\n")
# 	file.write("!" + str(feeder_obj.b_current_ll) + "\n")
# 	file.write("!FTP\n")
# 	file.write("!FTP URL\n")
# 	file.write("!" + str(filename) + "\n")
# 	file.write("!22\n")
# 	file.write("!33\n")
# 	file.write("!44\n")
# 	file.write("!66\n")
# 	file.write("!77\n")
# 	file.write("!AB\n")
# 	file.write("!CD\n")
# 	file.write("!EF\n")
# 
# 	file.close() 
# 	return serve(request, os.path.basename(path), os.path.dirname(path))
