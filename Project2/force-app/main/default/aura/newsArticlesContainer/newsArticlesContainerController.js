({
    doInit : function(component, event, helper){

        let articlesCrypto = component.get("c.getCrypto"); 
        let articlesTech = component.get("c.getApple");
        let articlesProgramming = component.get("c.getProgramming");
        let articlesSalesforce = component.get("c.getSalesforce");
        

        articlesCrypto.setCallback(this, function(data) {
            component.set("v.crypto", data.getReturnValue());
        });
        articlesTech.setCallback(this, function(data) {
            component.set("v.tech", data.getReturnValue());
        });
        articlesProgramming.setCallback(this, function(data) {
            component.set("v.programming", data.getReturnValue());
        });
        articlesSalesforce.setCallback(this, function(data) {
            component.set("v.salesforce", data.getReturnValue());
        });
        

        $A.enqueueAction(articlesCrypto);
        $A.enqueueAction(articlesTech);
        $A.enqueueAction(articlesProgramming);
        $A.enqueueAction(articlesSalesforce);

        let favArticles = component.get("c.getMyArticles");
        favArticles.setCallback(this, function(data){
            console.log( "doInit", data.getReturnValue())
            component.set("v.favorites", data.getReturnValue());
            
        });
        $A.enqueueAction(favArticles);
        
    }, 
    
    handleRefresh : function(component, event, helper){
        let favArticles = component.get("c.getMyArticles");
        favArticles.setCallback(this, function(data){
            component.set("v.favorites", data.getReturnValue());
        });
        $A.enqueueAction(favArticles);
    }
})
