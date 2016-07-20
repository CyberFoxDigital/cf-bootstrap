#Media Orb Wordpress Base Theme v.2.0a

**Please do read this file, it will help with putting sites live and the overall development proccess**

Initialising the Files
----------------------
When the website is in the dev area, you will want to edit the SCSS files and _\*.js files which are both found in *assets/*. Before you can do this however, you will need to log in to PUTTY with the *local ftp account*. Once you are logged in run these command in the theme directory (wp-content/themes/mo-wordpress).

```sh
cd wp-content/themes/mo-wordpress;
npm install;
bower install;
gulp watch;
```

Once you've run these, ensure the files have the correct ownership [ftp-user:psacln], you may need to change the **group** ownership of the *node_modules*, *dist* and *bower_components* directories to development and the directory permissions to **775**

You can now edit the SCSS files and compile the changes.

Differences to v1.0
-------------------
* This theme differentiates between touch and non-touch devices, as well as screen size, so when building responsive functionality please consider where the rules are applicable, following a mobile-first protocol.
* The theme makes use of new HTML5 images, which scale depending on viewport - saving lots of bandwidth. Not much work, if any, is required from the developer for this, but please bare in mind with background images and create multiple size version for viewport sizes. **Don't follow a one-size fits all policy with large images**
* The best menu with slideout is not navbar anymore, it's pills as these columise in touch view.
* Gulp will now take care of minimising files, and does a good job of optimising js, css and images (lossless).
* The theme is a lot more minimalist in general, and no longer includes dependency of third-party plugins that need to be installed seperately. 
* The theme includes much better 'app' markup, including a manifest.json which should be updated to reflect the company that the site is for. **Please use *http://realfavicongenerator.net/* to generate manifest.json, touch-icons and browserconfig.xml and make sure the markup in *template/head.php* is right**
* Rather than depending on *Visual Composer*, please develop bespoke page layouts using **custom post types** and use the **WordPress template heirachy** for bespoke styling. This is important because *Visual Composer* has a **LOT** of bloat which needs to go.

Making changes
--------------

To recompile the JS and the CSS you need to run:

```sh
gulp
```

Alternatively you can make changes to the files and have gulp compile automatically with:

```sh
gulp watch
```

However this will not work if you are using the minified files (which you probably will be after development stage), you must use **gulp --production** in this scenario . Also, when you've finished you will need to run grunt build to ensure the minified versions are up to date.

Ensure that you create a git project for each website and make sure that you commit your changes as you make them with
```sh
git add .;
git commit -m 'YOUR MESSAGE GOES HERE';
git push origin master;
```
# cf-bootstrap
