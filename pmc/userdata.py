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

@login_required(login_url='/login/')
@csrf_exempt
@ajax
def post_userdata(request):
    if request.method == 'POST':
        response_data = request.POST.dict()
        try:
            if User.objects.filter(username=response_data.get('user_name')).exists():
                return {"responseCode":400,
                    "Message":"""User allready present"""}
            else:
                user_obj = User.objects.create_user(first_name=response_data.get('first_name'),
                                               last_name=response_data.get('last_name'),
                                               username=response_data.get('user_name'),
                                               password=response_data.get('user_password'))
                Userdata.objects.get_or_create(user=user_obj,
                                               authority=response_data.get('user_authority'),
                                               role_division=response_data.get('user_division_role'),
                                               role_subdivision=response_data.get('user_subdivision_role'),
                                               created_by=request.user, password=response_data.get('user_password'),
                                               modified_by=request.user)
                return {"responseCode":200,
                    "Message":"""User Successfully added."""}
        except:
            return {"responseCode":400,
                    "Message":"""Something went wrong"""}


@login_required(login_url='/login/')
@csrf_exempt
@ajax
def get_user_alarm_list(request):
        response = []
        try:
            return {'user_data': [{
                                    'id': str(user.id),
                                    'name': str(user.user.first_name) + " " + str(user.user.last_name),
                                    'user_name': str(user.user.username),
                                    'user_password': str(user.password),
                                    'authority': str(user.authority),
                                    'role_division': str(user.role_division),
                                    'role_subdivision': str(user.role_subdivision),
                                    } for user in Userdata.objects.filter(is_active=True)],
                    'alaram_list': [{
                                    'id': str(alarm.id),
                                    'feeder_name': str(alarm.feeder.feeder_name),
                                    'fault_name': str(alarm.fault_type),
                                    'nos': str(alarm.number_1) + "," + str(alarm.number_2) + "," + str(alarm.number_3) + ","\
                                            + str(alarm.number_4) + "," + str(alarm.number_5) + "," + str(alarm.number_6)

                                    } for alarm in Alarm.objects.all()]
                    }
        except  ObjectDoesNotExist:
            return
            {
                'errorCode': 503,
                'errorMessage': "User not found"
            }

@login_required(login_url='/login/')
@csrf_exempt
@ajax
def edit_userdata(request):
        try:
            response_data = request.POST.dict()
            user_obj = Userdata.objects.get(id=int(response_data.get('user')))
            user_obj.user.first_name = str(response_data.get('first_name'))
            user_obj.user.last_name = str(response_data.get('last_name'))
            user_obj.user.username = str(response_data.get('user_name'))
            user_obj.authority = str(response_data.get('user_authority'))
            user_obj.role_division = str(response_data.get('user_role_division'))
            user_obj.role_subdivision = str(response_data.get('user_role_subdivision'))
            user_obj.password = str(response_data.get('user_password'))
            user_obj.save()
            user = User.objects.get(id=user_obj.user_id)
            user.set_password(response_data.get('user_password'))
            user.save()
            return "User Successfully Updated."
        except  ObjectDoesNotExist:
            return
            {
                'errorCode': 503,
                'errorMessage': "User not found"
            }
