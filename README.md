OutpostApp
==========

OutpostApp is a simple file upload web application. It can be use for any of these purposes:
- File upload service to use on your computer as a private inbox.
- A public file upload service.


Quick Start
-----------

As an example, OutpostApp can be used to manage client uploads intra-organization:

Outpost - an endpoint you expose towards a client, you can have as many as you wish. Example could be 'Acme Corp'.
Location - a folder or topic you wish to set per client, such as 'Acme Corp / Assets', or 'Acme Corp / Documents'.

Each location can have

* File upload limit
* Rolling file location 
* Notifications


Features
--------

* Upload files, limit file sizes and types.
* Automatic management/maintenance of uploads
  - Define many Outposts
  - Each Outpost holds several locations, where a location can be rolling i.e. after 24 hours
    archive the current location and roll into a new one.
* Automatic notifications (email).
* Web frontend.

Screenshots
-----------
![Outposts](https://github.com/jondot/outpost/blob/develop/doc/outpost1.jpg "Outposts")
![Files in Outpost](https://github.com/jondot/outpost/blob/develop/doc/outpost2.jpg "Files in Outpost")


Components
----------

* Configurator (`OutpostApp`), a Rails app responsible for configuration of elements and
  viewing of the activity in the system.
* Uploader (`UploaderApp`), a Sinatra app responsible for taking in uploads. Can/should be
  mounted separately.
* Downloader (`DownloaderApp`), a Sinatra app responsible for serving downloads. Can/should be
  mounted separately if needed.

Additional Scenarios
--------------------
A public uploads service a-la rapid-*.

* Run `OutpostApp` on one machine to serve all of the different configurations of the system.
* Run `UploaderApp` on several machines, several processes to handle big uploads. Optionally also
  use nginx's features for file uploads (only dispatch to `UploaderApp` when file upload complete).
* Run `DownloaderApp` on similar setup as `UploaderApp`, but it is recommended to make use of CDN.

A private upload service.

* Run `OutpostApp` as is, using thin is recommended. Make sure to open up a port and have a viable
  DNS mapping.
* As a convenience have the root uploads folder on your desktop :)

