"""pmclights URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from pmc.views import *
from pmc.userdata import *
from pmc.generate_program import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', home),
    url(r'^login/$', user_login),
    url(r'^logout/$', user_logout, name='logout'),
    url(r'^getDivision/$', division, name='division'),
    url(r'^getSubDivision/$', sub_division, name='sub_division'),
    url(r'^getFeeder/$', feeder, name='feeder'),
    url(r'^getOnlyFeeder/$', only_feeder, name='only_feeder'),
    url(r'^getFeederInfo/$', feeder_info, name='feeder_info'),
    # url(r'^getAllFeeder/$', all_feeder, name='all_feeder'),
    url(r'^getFeederData/$', feeder_data, name='feeder_data'),
    url(r'^getAllFeederData/$', all_feeder_data, name='all_feeder_data'),
    url(r'^getFeederSettings/$', feeder_settings, name='feeder_settings'),
    url(r'^getUser/$', get_user_alarm_list, name='get_user_alarm_list'),
    url(r'^getFault/$', get_fault_list, name='get_fault_list'),
	url(r'^generate_prog/$', generate_prog, name='generate_prog'),
    url(r'^logs/$', logs, name='logs'),
    url(r'^monitor/$', monitor, name='monitor'),
    url(r'^userdata/$', userdata, name='userdata'),
    url(r'^alarm/$', alarm, name='alarm'),
    url(r'^configure/$', configure, name='configure'),
    url(r'^control/$', control, name='control'),
	url(r'^all/$', view_all, name='view_all'),
	url(r'^post_data/$', post_data, name='post_data'),
    url(r'^post_division/$', post_division, name='post_division'),
    url(r'^post_subdivision/$', post_subdivision, name='post_subdivision'),
    url(r'^post_userdata/$', post_userdata, name='post_userdata'),
    url(r'^edit_userdata/$', edit_userdata, name='edit_userdata'),
    url(r'^edit_alarmdata/$', edit_alarmdata, name='edit_alarmdata'),
    url(r'^edit_faulterror/$', edit_faulterror, name='edit_faulterror'),
    url(r'^download_errorlog/$', download_errorlog, name='download_errorlog'),
    url(r'^allDivision/$', all_division, name='all_division'),
    url(r'^all_subdivision/$', all_subdivision, name='all_subdivision'),
]
