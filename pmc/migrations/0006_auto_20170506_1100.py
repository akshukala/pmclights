# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-05-06 11:00
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pmc', '0005_auto_20170505_1004'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='feeder',
            name='billdue_date',
        ),
        migrations.RemoveField(
            model_name='feeder',
            name='ct_ratio',
        ),
        migrations.RemoveField(
            model_name='feeder',
            name='description',
        ),
        migrations.RemoveField(
            model_name='feeder',
            name='faultsmslist',
        ),
        migrations.RemoveField(
            model_name='feeder',
            name='meter_number',
        ),
        migrations.RemoveField(
            model_name='feeder',
            name='pt_ratio',
        ),
        migrations.AddField(
            model_name='feeder',
            name='b_current_ll',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='b_current_ul',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='b_volt_ll',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='b_volt_ul',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='bct_ratio',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='r_current_ll',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='r_current_ul',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='r_volt_ll',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='r_volt_ul',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='rct_ratio',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='y_current_ll',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='y_current_ul',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='y_volt_ll',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='y_volt_ul',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='feeder',
            name='yct_ratio',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='feeder',
            name='created_by',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='feeder',
            name='modified_by',
            field=models.CharField(max_length=50),
        ),
    ]