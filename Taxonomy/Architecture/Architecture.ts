/**
 * 
 * A effort to to build, maintain, govern, evolve and dispose an architecture,
 * not the architecture materialized itself.
 * @since 0.0.0
 */
export interface Architecture { 


    /**
     * The paradigms that will orient the effort
     * @example Enterprise Agility
     * @example Customer Driven
     * @example Value Driven
     * @example Data Driven
     * @example Continuoum Improvement
     */
    paradigms: Map<string,object>


    /**
     * The management areas to be used in the architecture.
     * @example Financial Management
     * @example Change Management
     * @example Risk Management
     */
    managements: Map<string,object>


    /**
     * The architecture design dimensions
     * @example  Level of detail
     * @example  Temporal periodo of the design , past, night , future
     * @example  Domains applied, electricity, business, information.
     */
    dimensions: Map<string,object>

}