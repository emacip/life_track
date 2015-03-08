var demoLive = false;
var oldPY;

var killValue = 0;
var killNumRow = 0;


function killRevive() {

   demoLive = !demoLive;

   if ( demoLive == true ) {
      oldPY = py;
   } else {
      py = oldPY;
   }

}

function bufferOnGraph() {

   var x = document.getElementById("demo");
 
   py = 21;

  
//var offsets = document.getElementById('demo').getBoundingClientRect();
//var top = offsets.top;

//alert(top);




}

var arrayHeart = [150, 149, 142, 129, 105, 81, 62, 50, 40, 34, 28, 25, 23, 23, 30, 64, 119, 182, 222, 246, 260, 269, 272, 274, 271, 261, 242, 216, 190, 166, 154, 145, 138, 132, 130, 129, 128, 129, 130, 131, 133, 134, 134, 135, 136, 137, 136, 131, 117, 102, 87, 76, 70, 68, 68, 69, 85, 115, 172, 212, 247, 265, 278, 285, 287, 284, 268, 245, 218, 189, 162, 139, 123, 111, 105, 102, 101, 102, 105, 112, 119, 126, 130, 132, 133, 134, 138, 143, 148, 151, 151, 150, 140, 122, 97, 80, 46, 37, 28, 24, 24, 32, 45, 70, 106, 148, 188, 225, 249, 265, 278, 284, 286, 283, 276, 265, 247, 228, 216, 209, 202, 198, 192, 188, 186, 183, 183, 181, 178, 174, 170, 167, 166, 165, 164, 159, 155, 150, 148, 147, 148, 147, 137, 122, 105, 87, 72, 66, 62, 62, 63, 84, 111, 155, 202, 240, 267, 293, 294, 270, 243, 219, 200, 187, 179, 167, 162, 158, 156, 151, 148, 145, 143, 139, 136, 132, 129, 128, 127, 128, 133, 138, 141, 143, 144, 145, 145, 146, 147 ];


var ctx = demo.getContext('2d'),
    w = demo.width,
    h = demo.height,
    px = 0, opx = 0, speed = 3,
    py = h * 0.8, opy = py,
    scanBarWidth = 20;

var showValues = false;

var indexHeart = 0;

ctx.strokeStyle = '#00bd00';
ctx.lineWidth = 3;

demo.onmousemove = function(e) {
    var r = demo.getBoundingClientRect();
    py = e.clientY - r.top;

   if ( showValues == true ) {
   var elem = document.getElementById("logRate");
   elem.innerHTML += ', '+py;

   }
}
loop();

function loop() {

  if ( demoLive ) {
      py = arrayHeart[indexHeart];
      indexHeart = indexHeart == arrayHeart.length ? 0 : indexHeart+1;   
   }

   if ( py ==  killValue  ) {

      if (killNumRow < 200)
         killNumRow++;
   }else {
      killNumRow = 0;
      killValue = py;
      ctx.strokeStyle = '#00bd00';
   }

   if (killNumRow > 20) {
      ctx.strokeStyle = '#E83249';
   }


    px += speed;
    
    ctx.clearRect(px,0, scanBarWidth, h);
    ctx.beginPath();
    ctx.moveTo(opx, opy);
    ctx.lineTo(px, py);
    ctx.stroke();
    
    opx = px;
    opy = py;
    
    if (opx > w) {
        px = opx = -speed;
    }
    
    requestAnimationFrame(loop);
}


//panpan

//$(document).ready(function(){
//	setInterval(function(){
//		$(".bm-value").hasClass('glow') ? $(".bm-value").removeClass('glow') : $(".bm-value").addClass('glow');
//	}, 1000);
//});

$(document).ready(function(){
	setInterval(function(){
		$(".bm-value").fadeTo(
			1000, 0.6
		);
		$(".bm-value").fadeTo(
			1000, 1
		);
	}, 1);	
})

//$(document).ready(function(){
//	$(function(){
//		var state=true;
//		if (state){
//			$(".bm-value").animate({
//				color:rgb(160,255,255)
//			}, 1000);
//		} else {
//			$(".bm-value").animate{
//				color:rgb(0,255,255)
//			},1000
//		}
//	})
//})
