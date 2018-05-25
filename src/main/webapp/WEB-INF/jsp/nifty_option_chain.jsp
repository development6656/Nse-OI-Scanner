<!doctype html>
<html>
  <head>
    <title>Intraday Top Put Nifty Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="js_css_include.jsp"/>
   
<script>
        $.ajax({
        	type:'Get',
        	url: 'https://jsr101.herokuapp.com/option_chain_reader',
        	success: function(result){
        		var json = result.pcrOI;
        		if(json>1)
        			text="<span class='blinking' style='color: #00c853; font-weight: bold; font-size: 18px;'>" +json+ "</span>";
        			else
        			text="<span class='blinking' style='color: #CC0000; font-weight: bold; font-size: 18px;'>" +json+ "</span>";
        			
          		 $("#OptionsNiftyPCR").html(text);
        	
        }
        })
        
function blinker() {
	$('.blinking').fadeOut(500);
	$('.blinking').fadeIn(500);
}
setInterval(blinker, 1000);

</script>

<script>
        $.ajax({
        	type:'Get',
        	url: 'https://jsr101.herokuapp.com/indices',
        	success: function(result){
        		var lastPrice = result.data[5].lastPrice;
        		var pChange=result.data[5].pChange;
        		 if(pChange>0){
        			plain="<span style='color: #004d40; font-weight: bold; font-size: 16px;'>" +lastPrice+ "</span>";
       				text="<span  style='color: #FF8800; font-weight: bold; font-size: 16px;'>" +lastPrice+ "</span>";
           			text1="<span  style='color: #00e676; font-weight: bold; font-size: 16px;'>" + pChange + "%</span>";
        			}
        			else{
        			plain="<span style='color: #004d40; font-weight: bold; font-size: 16px;'>" +lastPrice+ "</span>";
        			text="<span  style='color: #00e676; font-weight: bold; font-size: 16px;'>" +lastPrice+ "</span>";
        			text1="<span style='color: #FF8800; font-weight: bold; font-size: 16px;'>" + pChange + "%</span>";
        			}
        			
          		 $("#IndiaVix").html(text);
          		 $("#IndiaVixInfo").html(plain); 
          		 $("#IndiaVixPerChange").html(text1);
        	
        }
        })

</script>
   
   
   
    <script type="text/javascript">

    $(document).ready(function() {
        $('#example').DataTable( {
            "processing": true,
            "order": [[ 10, "asc" ]],
            "pageLength": 100,
            "ajax": "https://jsr101.herokuapp.com/option_chain_nifty",
            "columns": [
            	  { "data": "oi_call" ,
                    	render: function ( data, type, row ) {
                    		data=data.split(',').join('');//remove comma
                            if (data >= 5000000) {
                              return '<span class="liteGreen">'+data+'</span>';
                            } else	if (data >= 3000000 && data < 5000000) {
                            	 return '<span class="yellow">'+data+'</span>';
                            } else {
                              return '<span>'+data+'</span>';
                            }
                          }
            	  },
                  { "data": "chng_in_oi_call" ,
                  	render: function ( data, type, row ) {
                		data=data.split(',').join('');//remove comma
                        if (data >= 1000000) {
                          return '<span class="cyan">'+data+'</span>';
                        } else	if (data >= 500000 && data < 1000000) {
                        	 return '<span class="yellow">'+data+'</span>';
                        } else if (data<0){
                        	return '<span class="negative">'+data+'</span>';
                        }
                        else{
                          return '<span>'+data+'</span>';
                        }
                      }
                  },
                  { "data": "volume_call" },
                  { "data": "iv_call" },
                  { "data": "ltp_call" ,
                     	 render: function ( data, type, row ) {
                           
                           return '<span class="symbol">'+data+'</span>';
                         
                       }
                  },
                  { "data": "net_chng_call" ,
                    	render: function ( data, type, row ) {
                            if (data >= 0) {
                              return '<span class="liteGreen">'+data+'</span>';
                            } else {
                              return '<span class="negative">'+data+'</span>';
                            }
                          }
                  },
                  { "data": "bid_qty_call" },
                  { "data": "bid_price_call" },
                  { "data": "ask_price_call" },
                  { "data": "ask_qty_call" },
                  { "data": "strikePrice",
                 	 render: function ( data, type, row ) {
                         
                         return '<span class="symbol">'+data.split('.')[0]+'</span>';
                       
                     } 
                  },
                  { "data": "bid_qty_put" },
                  { "data": "bid_price_put" },
                  { "data": "ask_price_put" },
                  {"data" : "ask_qty_put"},
                  { "data": "net_chng_put" ,
                  	render: function ( data, type, row ) {
                        if (data >= 0) {
                          return '<span class="liteGreen">'+data+'</span>';
                        } else {
                          return '<span class="negative">'+data+'</span>';
                        }
                      }
                  },
                  { "data": "ltp_put" ,
                  	 render: function ( data, type, row ) {
                         
                         return '<span class="symbol">'+data+'</span>';
                       
                     }
                  },
                  { "data": "iv_put" },
                  { "data": "volume_put" },
                  { "data": "chng_in_oi_put" ,
                    	render: function ( data, type, row ) {
                    		data=data.split(',').join('');//remove comma
                            if (data >= 1000000) {
                              return '<span class="cyan">'+data+'</span>';
                            } else	if (data >= 500000 && data < 1000000) {
                            	 return '<span class="yellow">'+data+'</span>';
                            }else if (data<0){
                            	return '<span class="negative">'+data+'</span>';
                            } else {
                              return '<span>'+data+'</span>';
                            }
                          }
                  },
                  { "data": "oi_put" ,
                  	render: function ( data, type, row ) {
                		data=data.split(',').join('');//remove comma
                        if (data >= 5000000) {
                          return '<span class="liteGreen">'+data+'</span>';
                        } else	if (data >= 3000000 && data < 5000000) {
                        	 return '<span class="yellow">'+data+'</span>';
                        } else {
                          return '<span>'+data+'</span>';
                        }
                      }
                  }
            ]
        } );
    } );
    </script>
    
    
     <style type="text/css">
 div.container {
        width: 80%;
    }
 </style>
 
  </head>
  <body>
  <jsp:include page="menu.jsp"/>
  
  
  
<fieldset class="field_set" style="margin-left:28px;margin-right:28px;">
<legend>Option Chain (Equity Derivatives)</legend>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Boot Dashboard <span class="glyphicon glyphicon-dashboard" style="font-size: 12px; color: #ffbb33;"></span>&nbsp;Market Breadth &amp; Trend
        <span class="glyphicon glyphicon-resize-small" style="font-size: 16px; color: #ffbb33;"></span> &nbsp; IndiaVix LTP# [&nbsp;<span style="color: #00e676;" id="IndiaVix"></span>&nbsp;] IndiaVix Change#[&nbsp;<span style="color: #00e676;" id="IndiaVixPerChange"></span>&nbsp;] <span class="glyphicon glyphicon-resize-small" style="font-size: 16px; color: #ffbb33;"></span>
        Nifty Put-Call-Ratio (PCR)# [&nbsp;<span style="color: #00e676;" id="OptionsNiftyPCR"></span>&nbsp;]</h3>
    </div>
    <div class="panel-body">
	<table id="example"	class="display compact table-striped table-bordered dt-responsive" style="width: 100%">
		<thead>
		 <tr>
                <th rowspan="2">OI</th>
                <th style="text-align:center;  vertical-align:middle;" colspan="9">CALLS</th>
                <th colspan="1">Strike</th>
                <th style="text-align:center;  vertical-align:middle;" colspan="9">PUTS</th>
                <th rowspan="2">OI</th>
            </tr>
		
			<tr>
							<!-- <th>OI</th> -->
							<th style="text-align:center;  vertical-align:middle;">Chng<br/>OI</th>
							<th style="text-align:center;  vertical-align:middle;">Vol</th>
							<th style="text-align:center;  vertical-align:middle;">IV</th>
							<th style="text-align:center;  vertical-align:middle;">LTP</th>
							<th style="text-align:center;  vertical-align:middle;">Net<br/>Chng</th>
							<th style="text-align:center;  vertical-align:middle;">Bid<br/>Qty</th>
							<th style="text-align:center;  vertical-align:middle;">Bid<br/>Price</th>
							<th style="text-align:center;  vertical-align:middle;">Ask<br/>Price</th>
							<th style="text-align:center;  vertical-align:middle;">Ask<br/>Qty</th>
							<th style="text-align:center;  vertical-align:middle;">Strike</th>
							<th style="text-align:center;  vertical-align:middle;">Bid<br/>Qty</th>
							<th style="text-align:center;  vertical-align:middle;">Bid<br/>Price</th>
							<th style="text-align:center;  vertical-align:middle;">Ask<br/>Price</th>
							<th style="text-align:center;  vertical-align:middle;">Ask<br/>Qty</th>
							<th style="text-align:center;  vertical-align:middle;">Net<br/>Chng</th>
							<th style="text-align:center;  vertical-align:middle;">LTP</th>
							<th style="text-align:center;  vertical-align:middle;">IV</th>
							<th style="text-align:center;  vertical-align:middle;">Vol</th>
							<th style="text-align:center;  vertical-align:middle;">Chng<br/>OI</th>
							<!-- <th>OI</th> -->
						</tr>
		</thead>

	</table>

		</div>
	</div>
	</fieldset>
</body>
</html>