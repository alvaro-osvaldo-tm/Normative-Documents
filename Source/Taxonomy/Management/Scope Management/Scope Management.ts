/**
 * An interface for a scope management
 * @since 0.0.0
 */
export interface Scope_Management {
	/**
	 * A Scope management title
	 */
	title: string;

	/**
	 * The entities that will be scope's managed
	 * The key is the domain
	 * The values is a list of managed entities.
	 */
	entities: Map<string, Array<object>>;

	/**
	 * An specification for the scope complexity
	 * measurement
	 */
	complexity: object;

	/**
	 * An specification for the scope fidelity
	 * measurement
	 */
	fidelity: object;
}
