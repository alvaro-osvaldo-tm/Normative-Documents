/**
 * Any element that exists in an architectural design
 * @since 0.0.0
 */
export interface Architectural_Element { 



    /**
     * Why the element exists
     */
    purpose: object

    /**
     * What the element statisfies  that justify their existence
     * @example A architectural goal
     * @example A architectural requirement
     * @example Other architectural element
     */

    satisfies: object

}