# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-07-04 06:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pmc', '0020_auto_20170616_1157'),
    ]

    operations = [
        migrations.AddField(
            model_name='sendtoclient',
            name='update_time',
            field=models.CharField(blank=True, max_length=55),
        ),
    ]
