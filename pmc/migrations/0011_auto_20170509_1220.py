# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-05-09 12:20
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pmc', '0010_auto_20170509_1207'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='alaram',
            name='feederdata',
        ),
        migrations.AddField(
            model_name='alaram',
            name='feeder',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='pmc.Feeder'),
        ),
    ]
