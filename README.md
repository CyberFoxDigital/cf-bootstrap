#Opencart 2 Boilerplate Starter Theme v.0.1a

Initialising the Files
----------------------
To begin using this theme you will need to SSH into your server and navigate to the theme directory. You will then need to install NPM, Bower and run Gulp for the first time. 

```sh
cd catalog/view/theme/cf-opencart;
npm install;
bower install;
gulp;
```

If you run into problems, ensure file permissions and ownership are correct. Sometimes its necessary to run the following commands after npm install

```sh
npm install -g gifsicle
npm install -g optipng
npm install -g optipng-bin
npm install -g jpegtran
npm install -g jpegtran-bin
```

Finally, edit the devUrl variable in assets/manifest.json to your website. 

Making your theme
-----------------
If you followed the steps above you should now be able to run the following command to edit the SCSS and JS files and compile the changes in real-time:

```sh
gulp watch
```

When your theme is ready, you should run the following command to minify the CSS and JS

```sh
gulp --production
```
