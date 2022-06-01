var express = require('express');
var mysql = require('./dbcon.js');
var bodyParser = require('body-parser');

var app = express();
var handlebars = require('express-handlebars').create({
        defaultLayout:'main',
        });

app.engine('handlebars', handlebars.engine);
app.use(bodyParser.urlencoded({extended:true}));
app.use('/static', express.static('public'));
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);
app.set('mysql', mysql);
app.use('/', express.static('public'));


function getFullBlank(res, mysql, context, complete,info){
		var command = "SELECT * FROM " + info;
        mysql.pool.query(command, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.Page  = results;
            complete();
        });
}

function getWebPage (req, res, next,info){
	var callbackCount = 0;
        var context = {};
        var mysql = req.app.get('mysql');
        getFullBlank(res, mysql, context, complete,info);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.status(200).render(info, context);
            }

    }
}
app.get('/Item_IDs.html', function(req, res, next){
	getWebPage(req, res, next,'Item_IDs');
});

app.get('/Weapons.html', function(req, res, next){
	getWebPage(req, res, next,'Weapons');
});
app.get('/Weapon_Stats.html', function(req, res, next){
	getWebPage(req, res, next,'Weapon_Stats');
});

app.get('/Armors.html', function(req, res, next){
	getWebPage(req, res, next,'Armors');
});
app.get('/Armor_Stats.html', function(req, res, next){
	getWebPage(req, res, next,'Armor_Stats');
});



app.use(function(req,res, next){
  res.status(404);
  res.render('404');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function(){
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
