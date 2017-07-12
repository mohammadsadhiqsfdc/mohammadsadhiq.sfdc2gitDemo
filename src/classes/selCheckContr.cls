public class selCheckContr {

    public PageReference test() {
        return null;
    }


    public List<String> countries ;
    
    public List<String> getCountries(){ 
        return countries;
        } 

    public void setCountries(List<String> c){ 
        this.countries = c;
        } 
    
    public List<SelectOption> getItems() {
        List<SelectOption> opt = new List<SelectOption>();
        opt.add(new SelectOption('US','us'));
        opt.add(new SelectOption('CANADA','canada'));
        opt.add(new SelectOption('MEXICO','mexico'));
                    
        return opt;
    }    
}