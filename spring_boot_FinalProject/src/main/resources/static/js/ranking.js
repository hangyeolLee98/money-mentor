/**
 *  ranking
 */


$(document).ready(function(){
    
    var detail_id1 = $('.detail_id1').val();
    var detail_id2 = $('.detail_id2').val();
    var detail_id3 = $('.detail_id3').val();
    $('.detail').hide();
    $('.'+detail_id1).show();
    
    var cardInfo = [detail_id1, detail_id2, detail_id3] 
    $('.cardIndex_span').each(function(e){
    $(this).on('click',function(){
        $('.detail').hide();
        $('.'+cardInfo[e]).show();
    })
});

});
