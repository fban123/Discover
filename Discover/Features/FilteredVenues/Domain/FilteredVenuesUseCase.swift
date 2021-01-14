//
//  FilteredVenuesUseCase.swift
//  Discover
//
//  Created by FilipBan on 13/01/2021.
//

import RxSwift

class FilteredVenuesUseCase: FilteredVenuesUseCaseProtocol {
    
    private let repository: VenueDashboardRepositoryProtocol!
    
    init(repository: VenueDashboardRepositoryProtocol) {
        self.repository = repository
    }
    
    func getVenues(filter: String) -> Observable<[VenueDetails]> {
        return repository
            .getVenues()
            .asObservable()
            .map { venues in
                venues.filter { venue in
                    var containsFilteredTag = false
                    venue.primaryTags.forEach { tag in
                        containsFilteredTag = containsFilteredTag || tag.name == filter
                    }
                    
                    venue.secondaryTags.forEach { tag in
                        containsFilteredTag = containsFilteredTag || tag.name == filter
                    }
                    return containsFilteredTag
                }
            }
            .subscribeOnUtility()
    }
    
}
