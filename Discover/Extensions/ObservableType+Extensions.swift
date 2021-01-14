
import RxSwift

extension ObservableType {

    /**
     Wraps the share(replay:) operator together with the subscribeOn(.background).
     Use this instead of share(replay:) on data source layer.
     - parameter scheduler: This is an optional parameter that should only be used during testing. Do not use it in production code.
     */
    func shareAndSubscribeOnUtility(
        scheduler: SchedulerType = SerialDispatchQueueScheduler(qos: .utility)
    ) -> Observable<Element> {
        return self
            .share(replay: 1)
            .subscribeOn(scheduler)
    }

    func subscribeOnUtility(
        scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .utility)
    ) -> Observable<Element> {
        self.subscribeOn(scheduler)
    }

    func observeOnMain() -> Observable<Element> {
        self.observeOn(MainScheduler.instance)
    }

    func observeOnUtility(
        scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .utility)
    ) -> Observable<Element> {
        self.observeOn(scheduler)
    }

    /*
     Wraps the source sequence in order to run its observer callbacks on the main scheduler.
     */
    func withPresenterThreading() -> Observable<Self.Element> {
        self
            .do(onNext: { item in
                #if DEBUG
                if Thread.current.isMainThread {
                    // switching to main thread when you're already on the main thread is a code smell
                    // verify threading on your Rx chains
                    fatalError("Should **NOT** be on MAIN thread! Item:\(item)")
                }
                #endif
            })
            .observeOnMain()
            .subscribeOnUtility()
    }

    func mapVoid() -> Observable<Void> {
        self.map { _ in }
    }

    /**
     Same as `scan` but emits seed item on subscription

     - parameter seed: The initial accumulator value.
     - parameter accumulator: An accumulator function to be invoked on each element.
     - returns: An observable sequence containing the accumulated values.

     - seealso: [scan operator on reactivex.io](http://reactivex.io/documentation/operators/scan.html)
     */
    func scanWithInitial<A>(_ seed: A, accumulator: @escaping (A, Element) throws -> A) -> Observable<A> {
        scan(seed, accumulator: accumulator)
            .startWith(seed)
    }

    func flatMapCompletable(_ selector: @escaping (Element) -> Completable) -> Completable {
        return self
            .flatMap { element -> Observable<Never> in
                selector(element).asObservable()
            }
            .asCompletable()
    }

}

extension ObservableType where Element == Bool {

    /*
     Recreates `innerObservable` with factory closure when `signal` ramp is `true`.

     - parameter factory: Factory that creates the inner observable
     - returns: Observable.never when ramp is false, otherwise recreates with factory
     */
    func thenResubscribe<T>(_ factory: @escaping () -> Observable<T>) -> Observable<T> {
        return self.flatMapLatest { signalValue -> Observable<T> in
            if signalValue {
                return factory()
            }
            return Observable<T>.never()
        }
    }

}

