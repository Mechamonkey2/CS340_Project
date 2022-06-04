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

/* Gets the full page with the data being unedited, normaly used for the begining
	of the visit. Other functions will take care of editing, searching ect.
	This is also generlized for all tables, info is used for the table its
	grabbing. */
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

/* this works together with getFullBlank to run the page that is loaded.
	It was intended to be generlized for all uses, but I didnt have time
	to code it where it can chose whitch function would run for what.
	Also, the name of the handlebars page must be the EXACT same as the
	table in the Database.*/
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
/* Finds the specific information, cer, from the table, from, where something is
	keeped constant, where.
		Information given is not sanatized, it up to the calling funtion to do that */
function getCertanInfo(req, res, next, cer, from, where,info){
		var callbackCount = 0;
        var context = {};
        var mysql = req.app.get('mysql');
		var command = "SELECT " + cer + " FROM " + from + " WHERE " + where;
        mysql.pool.query(command, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.Page = results;
            complete();
        });
		function complete(){
            callbackCount++;
            if(callbackCount >= 1){
				res.status(200).render(info, context);
			}
		}
}




/* All the pages loaded normaly */
app.get('/Item_IDs', function(req, res, next){
	getWebPage(req, res, next,'Item_IDs');
});

app.get('/Gears', function(req, res, next){
	getWebPage(req, res, next,'Gears');
});

app.get('/Weapons', function(req, res, next){
	getWebPage(req, res, next,'Weapons');
});
app.get('/Weapon_Stats', function(req, res, next){
	getWebPage(req, res, next,'Weapon_Stats');
});

app.get('/Armors', function(req, res, next){
	getWebPage(req, res, next,'Armors');
});
app.get('/Armor_Stats', function(req, res, next){
	getWebPage(req, res, next,'Armor_Stats');
});

app.get('/Consumables', function(req, res, next){
	getWebPage(req, res, next,'Consumables');
});

/* All the pages that edit the tables */

/* All the pages that Search the tables */
app.post('/Armor_Stats/', function(req, res, next){
	console.log(req.body.searchData);
	console.log(req.body.searchDataAmount);
	if(req.body.searchData === "armorStatID" && req.body.searchDataAmount==0){
		getWebPage(req, res, next,'Armor_Stats');
	}else{
		getCertanInfo(req, res, next, "*", "Armor_Stats",(req.body.searchData+"="+req.body.searchDataAmount),"Armor_Stats");
	}
});
/* All the pages that Delete the information on table */



// 404 error
app.use(function(req,res, next){
  res.status(404);
  res.render('404');
});


//500 error
app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function(){
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
