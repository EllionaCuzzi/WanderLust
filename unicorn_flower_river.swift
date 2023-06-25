//1
import UIKit

//2
class AdventureTravelCompany {
    
    //3
    private var destinations = [Destination]()
    
    //4
    func addDestination(destination: Destination){
        destinations.append(destination)
    }
    
    //5
    func removeDestination(destination: Destination){
        if let index = destinations.index(of: destination){
            destinations.remove(at: index)
        }
    }
    
    //6
    func uniqueTravelExperiences() -> [TravelExperience]{
        var experiences = [TravelExperience]()
        for destination in destinations {
            experiences.append(contentsOf: destination.uniqueExperiences())
        }
        return experiences
    }
    
    //7
    func listDestinations() -> [Destination]{
        return destinations
    }
    
    //8
    func listDestinationNames() -> [String]{
        var names = [String]()
        for destination in destinations{
            names.append(destination.name)
        }
        return names
    }
    
    //9
    func experienceForDestination(destinationName: String, experienceName: String) -> TravelExperience? {
        var experience: TravelExperience? = nil
        for destination in destinations {
            if destination.name == destinationName {
                experience = destination.experienceForName(name: experienceName)
            }
        }
        return experience
    }
    
    //10
    func priceForDestination(destinationName: String, experienceName: String) -> Double? {
        if let experience = experienceForDestination(destinationName: destinationName, experienceName: experienceName) {
            return experience.price
        }
        return nil
    }
    
    //11
    func allExperiences() -> [TravelExperience]{
        var experiences = [TravelExperience]()
        for destination in destinations {
            experiences.append(contentsOf: destination.experiences)
        }
        return experiences
    }
    
    //12
    func listExperienceNames() -> [String]{
        var names = [String]()
        for experience in allExperiences(){
            names.append(experience.name)
        }
        return names
    }
    
    //13
    func totalPriceForDestination(destinationName: String) -> Double{
        var totalPrice = 0.0
        for experience in allExperiences() {
            if experience.destinationName == destinationName {
                totalPrice += experience.price
            }
        }
        return totalPrice
    }
    
    //14
    func listExperiencesByPrice(ascending: Bool = true) -> [TravelExperience]{
        return allExperiences().sorted(by: {ascending ? $0.price < $1.price : $0.price > $1.price })
    }
    
    //15
    func listExperiencesByName(ascending: Bool = true) -> [TravelExperience]{
        return allExperiences().sorted(by: {ascending ? $0.name < $1.name : $0.name > $1.name })
    }
    
    //16
    func listExperiencesByDestination(ascending: Bool = true) -> [TravelExperience] {
        return allExperiences().sorted(by: {ascending ? $0.destinationName < $1.destinationName : $0.destinationName > $1.destinationName})
    }
    
    //17
    func listDestinationsByName(ascending: Bool = true) -> [Destination]{
        return listDestinations().sorted(by: {ascending ? $0.name < $1.name : $0.name > $1.name })
    }
    
    //18
    func mostExpensiveExperience() -> TravelExperience?{
        var mostExpensive: TravelExperience? = nil
        for experience in allExperiences() {
            if mostExpensive == nil || experience.price > mostExpensive!.price {
                mostExpensive = experience
            }
        }
        return mostExpensive
    }
 
    //19
    func leastExpensiveExperience() -> TravelExperience?{
        var leastExpensive: TravelExperience? = nil
        for experience in allExperiences() {
            if leastExpensive == nil || experience.price < leastExpensive!.price {
                leastExpensive = experience
            }
        }
        return leastExpensive
    }
    
    //20
    func averageExperiencePrice() -> Double{
        var totalPrice = 0.0
        for experience in allExperiences() {
            totalPrice += experience.price
        }
        return totalPrice / Double(allExperiences().count)
    }
    
    //21
    func listDestinationsByPrice(ascending: Bool = true) -> [Destination] {
        var destByPriceList = [Destination]()
        
        for dest in listDestinations(){
            let destPrice = totalPriceForDestination(destinationName: dest.name)
            destByPriceList.append((dest, destPrice))
        }
        
        destByPriceList.sort(by: {ascending ? $0.1 < $1.1 : $0.1 > $1.1})
        return destByPriceList.map({$0.0})
    }
    
    //22
    func mostExpensiveDestination() -> Destination?{
        if let destPriceTuple = listDestinationsByPrice().last{
            return destPriceTuple
        }
        return nil
    }
    
    //23
    func leastExpensiveDestination() -> Destination?{
        if let destPriceTuple = listDestinationsByPrice().first{
            return destPriceTuple
        }
        return nil
    }
    
    //24
    func listExperiencesByDestinationPrice(ascending: Bool = true) -> [TravelExperience]{
        var destByPriceList = [Destination]()
        
        for dest in listDestinations(){
            let destPrice = totalPriceForDestination(destinationName: dest.name)
            destByPriceList.append((dest, destPrice))
        }
        
        destByPriceList.sort(by: {ascending ? $0.1 < $1.1 : $0.1 > $1.1})
        var experiences = [TravelExperience]()
        for destPriceTuple in destByPriceList {
            experiences.append(contentsOf: destPriceTuple.0.experiences)
        }
        return experiences
    }
    
    //25
    func mostExpensiveExperienceByDestination() -> TravelExperience? {
        var mostExpensiveByDestination: TravelExperience? = nil
        for experience in allExperiences() {
            if mostExpensiveByDestination == nil || experience.price > mostExpensiveByDestination!.price {
                mostExpensiveByDestination = experience
            }
        }
        return mostExpensiveByDestination
    }
    
    //26
    funcleastExpensiveExperienceByDestination() -> TravelExperience? {
        var leastExpensiveByDestination: TravelExperience? = nil
        for experience in allExperiences() {
            if leastExpensiveByDestination == nil || experience.price < leastExpensiveByDestination!.price {
                leastExpensiveByDestination = experience
            }
        }
        return leastExpensiveByDestination
    }
    
    //27
    func averageExperiencePriceByDestination() -> Double{
        var totalPrice = 0.0
        for experience in allExperiences() {
            totalPrice += experience.price
        }
        return totalPrice / Double(allExperiencesByDestination().count)
    }
    
    //28
    func allExperiencesByDestination() -> [TravelExperience] {
        var experiences = [TravelExperience]()
        for destination in destinations {
            experiences.append(contentsOf: destination.experiences)
        }
        return experiences
    }
    
    //29
    func listExperienceNamesByDestination() -> [String]{
        var names = [String]()
        for experience in allExperiencesByDestination(){
            names.append(experience.name)
        }
        return names
    }
    
    //30
    func searchExperiencesByName(searchString: String) -> [TravelExperience] {
        var experiences = [TravelExperience]()
        for experience in allExperiencesByDestination(){
            if experience.name.contains(searchString) {
                experiences.append(experience)
            }
        }
        return experiences
    }
    
    //31
    func searchExperiencesByDestination(searchString: String) -> [TravelExperience] {
        var experiences = [TravelExperience]()
        for experience in allExperiencesByDestination(){
            if experience.destinationName.contains(searchString) {
                experiences.append(experience)
            }
        }
        return experiences
    }
    
    //32
    func searchDestinationsByName(searchString: String) -> [Destination] {
        var names = [Destination]()
        for destination in destinations{
            if destination.name.contains(searchString){
                names.append(destination)
            }
        }
        return names
    }
    
    //33
    func searchDestinationsByDescription(searchString: String) -> [Destination] {
        var names = [Destination]()
        for destination in destinations{
            if destination.desc.contains(searchString){
                names.append(destination)
            }
        }
        return names
    }
    
    //34
    func searchDestinationsByLocation(searchString: String) -> [Destination] {
        var names = [Destination]()
        for destination in destinations{
            if destination.location.contains(searchString){
                names.append(destination)
            }
        }
        return names
    }
    
    //35
    func listExperiencesByLocation(ascending: Bool = true) -> [TravelExperience]{
        return allExperiences().sorted(by: {ascending ? $0.location < $1.location : $0.location > $1.location})
    }
    
    //36
    func listExperiencesByActivity(ascending: Bool = true) -> [TravelExperience]{
        return allExperiences().sorted(by: {ascending ? $0.activity < $1.activity : $0.activity > $1.activity})
    }
    
    //37
    func listDestinationsByActivity(ascending: Bool = true) -> [Destination]{
        var destByActivityList = [Destination]()
        
        for dest in listDestinations(){
            let destActivity = dest.activity
            destByActivityList.append((dest, destActivity))
        }
        
        destByActivityList.sort(by: {ascending ? $0.1 < $1.1 : $0.1 > $1.1})
        return destByActivityList.map({$0.0})
    }
    
    //38
    func searchDestinationsByActivity(searchString: String) -> [Destination] {
        var names = [Destination]()
        for destination in destinations{
            if destination.activity.contains(searchString){
                names.append(destination)
            }
        }
        return names
    }
    
    //39
    func searchExperiencesByActivity(searchString: String) -> [TravelExperience] {
        var experiences = [TravelExperience]()
        for experience in allExperiencesByDestination(){
            if experience.activity.contains(searchString) {
                experiences.append(experience)
            }
        }
        return experiences
    }
    
    //40
    func listExperiencesByPriceRange(minPrice: Double, maxPrice: Double) -> [TravelExperience]{
        var experiencesInPriceRange = [TravelExperience]()
        for experience in allExperiences(){
            if experience.price >= minPrice && experience.price <= maxPrice {
                experiencesInPriceRange.append(experience)
            }
        }
        return experiencesInPriceRange
    }
    
    //41
    func listDestinationsByPriceRange(minPrice: Double, maxPrice: Double) -> [Destination]{
        var destinationsInPriceRange = [Destination]()
        for destination in destinations{
            let totalPrice = totalPriceForDestination(destinationName: destination.name)
            if totalPrice >= minPrice && totalPrice <= maxPrice {
                destinationsInPriceRange.append(destination)
            }
        }
        return destinationsInPriceRange
    }
    
    //42
    func listExperiencesByDuration(minDuration: Double, maxDuration: Double) -> [TravelExperience]{
        var experiencesInDurationRange = [TravelExperience]()
        for experience in allExperiences(){
            if experience.duration >= minDuration && experience.duration <= maxDuration {
                experiencesInDurationRange.append(experience)
            }
        }
        return experiencesInDurationRange
    }
    
    //43
    func listExperiencesByRating(minRating: Double, maxRating: Double) -> [TravelExperience]{
        var experiencesInRatingRange = [TravelExperience]()
        for experience in allExperiences(){
            if experience.rating >= minRating && experience.rating <= maxRating {
                experiencesInRatingRange.append(experience)
            }
        }
        return experiencesInRatingRange
    }
    
    //44
    func listDestinationsByRating(minRating: Double, maxRating: Double) -> [Destination]{
        var destinationsInRatingRange = [Destination]()
        for destination in destinations{
            if destination.rating >= minRating && destination.rating <= maxRating {
                destinationsInRatingRange.append(destination)
            }
        }
        return destinationsInRatingRange
    }
    
    //45
    func experienceByRating(rating: Double) -> TravelExperience? {
        for experience in allExperiences(){
            if experience.rating == rating {
                return experience
            }
        }
        return nil
    }
    
    //46
    func destinationByRating(rating: Double) -> Destination? {
        for destination in destinations{
            if destination.rating == rating {
                return destination
            }
        }
        return nil
    }
    
    //47
    func listDestinationsByDuration(minDuration: Double, maxDuration: Double) -> [Destination]{
        var destinationsInDurationRange = [Destination]()
        for destination in destinations{
            let totalDuration = destination.totalDuration
            if totalDuration >= minDuration && totalDuration <= maxDuration {
                destinationsInDurationRange.append(destination)
            }
        }
        return destinationsIn