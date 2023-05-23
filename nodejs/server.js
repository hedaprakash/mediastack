'use strict';

const express = require('express');

const PORT = 80;
 
const app = express();
app.listen(PORT);

app.get('/', (req, res) => {
	var hostname = process.env["HOSTNAME"].split("-");
	res.send(hostname[hostname.length -2]); }); 

console.log(`Listening on ${PORT}`);
