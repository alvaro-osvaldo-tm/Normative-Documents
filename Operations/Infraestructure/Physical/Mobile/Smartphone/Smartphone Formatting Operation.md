# Smartphone Formatting Operation

On a smartphone, realize backup, erase all data and restore backup.


## Why do it

- Malwares cleanup
- Total storage cleanup
- Asset owner change.

## When do it

- When ensured no activities group's will require the smartphone during the day
	- Including financial activities 
	- Including authentication activities
- When ensured authentication activities can be done even without Smartphone to two-factor authentication.


## Who can do it

- Asset owner.

## Triggers

- **Any fail**: If any fails occur during procedure
	- If 
		- No formatting was done: 
			- Abort procedure
		- else
			- Declare crisis.

## Operation

###  Prepare

> Prepare itself and resources for the formatting.

- [ ] Connectivity
	- [ ] Ensure there is a wireless internet connection and will be able to connect again to these wireless internet connection.
	- [ ] Ensure the smartphone is connected to wi-fi wireless connection.
	- [ ] Ensure there will be able to receive paid SMS during the restoration.
- [ ] Power
	- [ ] Ensure that the smartphone have full battery load.
	- [ ] Ensure there is a charger available for smartphone.
- [ ] Security
	- [ ] Ensured will be able to restore Google Account to smartphone
	- [ ] Remove suspicious softwares [^1]


###  Backup

> Ensure all desired data will be save.

- [ ] Ensure passwords for restoration has been wrote to a physical media
	- [ ] Smartphone password
	- [ ] [Office Softwares](../../../../../Checklists/Services/Digital%20Softwares/Office%20Softwares.md)
- [ ] Ensure Multi-Factor authentication recovery was set
	- [ ] [Office Softwares](../../../../../Checklists/Services/Digital%20Softwares/Office%20Softwares.md)
	- [ ] Ensure Google Account multi-factor password backup. 
		- [ ] **Otherwise can be impossible to restore the backup.**
		- [ ] Ensure there is 'Backup Code' for Google Account and was save into a physical medial
		- [ ] Ensure smartphone screen lock PIN number or other password was save into a physical medial

- [ ] On `Settings -> System -> Backup`
	- [ ] Ensure *system backup* is active
		- [ ] Execute a full backup
		- [ ] Execute 'Photos and videos' backup
		- On `Google Account Data`
			- [ ] Ensure all sections are enabled and backup made.
- [ ] Ensure software data backup was done
	- [ ] [Office Softwares](../../../../../Checklists/Services/Digital%20Softwares/Office%20Softwares.md)
		- [ ] For Whatsapp, go on `Whatsapp -> Settings Chats -> Chat Backup` [^2]
			- [ ] Ensure videos backup option is enabled before backup.
	- [ ] Downloaded files
- [ ] Ensure configuration backups was done
	- [ ] Timer App
- [ ] Ensured system setting backups has been done.
	- [ ] Scheduled power on/off
	- [ ] Screen timeout
	- [ ] Notifications on lock screen


### Formatting

> Erase all smartphone data, these operation cannot be undone.

- [ ]  On `Settings -> System -> Reset Options` , select `Delete All data (factory reset)`
	- Once on according with smartphone information, select `Erase all data` to begin formatting.

### Restoration

> Restore all backup data 


- [ ] Start a fresh Android configuration.
	- [ ] Configure Wifi connection
	- [ ] Sign into the Google Account saved from [Backup](#Backup) step.
	- [ ] Agree to restore backup
	- [ ] Agree with desired Google services
	- [ ] Configure screen lock configuration.

### Configuration

> Restore all configuration 

- [ ] On `Settings -> System -> Apps and Notifications` , enable special permissions
	- [ ] For `wireless emergency alerts`
		- On `Wireless emergency alerts` , enable feature
		- On `Special app access`, access section `Unrestricted data` , enable `Wireless emergency alerts`.
- Restore all apps saved configuration in [backup](#Backup) step.


## Checklists



[^1]: Suspicious softwares that could been used to install malwares. It's necessary to reduce  contamination possibility when backup be made.
[^2]: https://faq.whatsapp.com/481135090640375/?locale=en_UK&cms_platform=android