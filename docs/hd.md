# Hard Disk

## Connect

Connect a hard disk to the Raspberry Pi via an SATA to USB adapter.

Check if HD has been detected with "df":

```
$ df -h
Dateisystem    Größe Benutzt Verf. Verw% Eingehängt auf
/dev/root        15G    5,9G  7,8G   43% /
devtmpfs        776M       0  776M    0% /dev
tmpfs           937M       0  937M    0% /dev/shm
tmpfs           375M    1,2M  374M    1% /run
tmpfs           5,0M    4,0K  5,0M    1% /run/lock
/dev/mmcblk0p1  255M     51M  205M   20% /boot
tmpfs           188M     24K  188M    1% /run/user/1000
/dev/sda2       112G     18G   95G   16% /media/leo/886
```

## Check HD

Install smartmontools:

```
sudo apt install smartmontools
```

Check smart status of HD:

```
sudo smartctl --all /dev/sda2
smartctl 7.2 2020-12-30 r5155 [armv7l-linux-5.15.76-v7l+] (local build)
Copyright (C) 2002-20, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Vendor:               Hitachi
Product:              HTS542512K9SA00
Revision:             BB2A
User Capacity:        120.034.122.240 bytes [120 GB]
Logical block size:   512 bytes
scsiModePageOffset: response length too short, resp_len=4 offset=4 bd_len=0
scsiModePageOffset: response length too short, resp_len=4 offset=4 bd_len=0
>> Terminate command early due to bad response to IEC mode page
A mandatory SMART command failed: exiting. To continue, add one or more '-T permissive' options.
```

Run Test:

```
$ sudo smartctl --test=long /dev/sda2
smartctl 7.2 2020-12-30 r5155 [armv7l-linux-5.15.76-v7l+] (local build)
Copyright (C) 2002-20, Bruce Allen, Christian Franke, www.smartmontools.org

Long (extended) offline self test failed [unsupported field in scsi command]
```

Check smart status for external HD via USB:

```
sudo smartctl -A -d sat /dev/sda
smartctl 7.2 2020-12-30 r5155 [armv7l-linux-5.15.76-v7l+] (local build)
Copyright (C) 2002-20, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000b   100   100   062    Pre-fail  Always       -       0
  2 Throughput_Performance  0x0005   100   100   040    Pre-fail  Offline      -       0
  3 Spin_Up_Time            0x0007   253   253   033    Pre-fail  Always       -       1
  4 Start_Stop_Count        0x0012   063   063   000    Old_age   Always       -       58487
  5 Reallocated_Sector_Ct   0x0033   100   100   005    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x000b   100   100   067    Pre-fail  Always       -       0
  8 Seek_Time_Performance   0x0005   100   100   040    Pre-fail  Offline      -       0
  9 Power_On_Hours          0x0012   075   075   000    Old_age   Always       -       11207
 10 Spin_Retry_Count        0x0013   100   100   060    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       289
191 G-Sense_Error_Rate      0x000a   100   100   000    Old_age   Always       -       0
192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       58
193 Load_Cycle_Count        0x0012   071   071   000    Old_age   Always       -       292283
194 Temperature_Celsius     0x0002   229   229   000    Old_age   Always       -       24 (Min/Max 18/53)
195 Hardware_ECC_Recovered  0x000a   100   100   000    Old_age   Always       -       0
196 Reallocated_Event_Count 0x0032   100   100   000    Old_age   Always       -       0
197 Current_Pending_Sector  0x0022   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0008   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x000a   200   200   000    Old_age   Always       -       0
223 Load_Retry_Count        0x000a   100   100   000    Old_age   Always       -       0
```

Run test on USB hd:

```
sudo smartctl -A -d sat --test=long /dev/sda
smartctl 7.2 2020-12-30 r5155 [armv7l-linux-5.15.76-v7l+] (local build)
Copyright (C) 2002-20, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000b   100   100   062    Pre-fail  Always       -       0
  2 Throughput_Performance  0x0005   100   100   040    Pre-fail  Offline      -       0
  3 Spin_Up_Time            0x0007   253   253   033    Pre-fail  Always       -       1
  4 Start_Stop_Count        0x0012   063   063   000    Old_age   Always       -       58488
  5 Reallocated_Sector_Ct   0x0033   100   100   005    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x000b   100   100   067    Pre-fail  Always       -       0
  8 Seek_Time_Performance   0x0005   100   100   040    Pre-fail  Offline      -       0
  9 Power_On_Hours          0x0012   075   075   000    Old_age   Always       -       11208
 10 Spin_Retry_Count        0x0013   100   100   060    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       289
191 G-Sense_Error_Rate      0x000a   100   100   000    Old_age   Always       -       0
192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       58
193 Load_Cycle_Count        0x0012   071   071   000    Old_age   Always       -       292285
194 Temperature_Celsius     0x0002   229   229   000    Old_age   Always       -       24 (Min/Max 18/53)
195 Hardware_ECC_Recovered  0x000a   100   100   000    Old_age   Always       -       0
196 Reallocated_Event_Count 0x0032   100   100   000    Old_age   Always       -       0
197 Current_Pending_Sector  0x0022   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0008   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x000a   200   200   000    Old_age   Always       -       0
223 Load_Retry_Count        0x000a   100   100   000    Old_age   Always       -       0

=== START OF OFFLINE IMMEDIATE AND SELF-TEST SECTION ===
Sending command: "Execute SMART Extended self-test routine immediately in off-line mode".
Drive command "Execute SMART Extended self-test routine immediately in off-line mode" successful.
Testing has begun.
Please wait 56 minutes for test to complete.
Test will complete after Sun Jan 15 10:29:39 2023 GMT
Use smartctl -X to abort test.
```

Check status again after test has ended:

```
$ sudo smartctl -A -d sat /dev/sda
smartctl 7.2 2020-12-30 r5155 [armv7l-linux-5.15.76-v7l+] (local build)
Copyright (C) 2002-20, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000b   100   100   062    Pre-fail  Always       -       0
  2 Throughput_Performance  0x0005   100   100   040    Pre-fail  Offline      -       0
  3 Spin_Up_Time            0x0007   253   253   033    Pre-fail  Always       -       1
  4 Start_Stop_Count        0x0012   063   063   000    Old_age   Always       -       58491
  5 Reallocated_Sector_Ct   0x0033   100   100   005    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x000b   100   100   067    Pre-fail  Always       -       0
  8 Seek_Time_Performance   0x0005   100   100   040    Pre-fail  Offline      -       0
  9 Power_On_Hours          0x0012   075   075   000    Old_age   Always       -       11208
 10 Spin_Retry_Count        0x0013   100   100   060    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       289
191 G-Sense_Error_Rate      0x000a   100   100   000    Old_age   Always       -       0
192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       58
193 Load_Cycle_Count        0x0012   071   071   000    Old_age   Always       -       292290
194 Temperature_Celsius     0x0002   220   220   000    Old_age   Always       -       25 (Min/Max 18/53)
195 Hardware_ECC_Recovered  0x000a   100   100   000    Old_age   Always       -       0
196 Reallocated_Event_Count 0x0032   100   100   000    Old_age   Always       -       0
197 Current_Pending_Sector  0x0022   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0008   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x000a   200   200   000    Old_age   Always       -       0
223 Load_Retry_Count        0x000a   100   100   000    Old_age   Always       -       0
```

## Format HD

todo?

## Mount HD

todo?
