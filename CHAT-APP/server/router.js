const express = require('express');
const router = express.Router();

router.get('/',(req,res)=>{
    res.send('server is up and running');//메시지 response
});

module.exports = router;
//router export