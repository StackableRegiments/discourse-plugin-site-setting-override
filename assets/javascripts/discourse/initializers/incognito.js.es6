export default {
name:'incognito',
initialize:function(){
$(function(){
console.log($(".incognito"));
$(".incognito").click(function(){
location.replace("/temporary_user");
});
});
}
};