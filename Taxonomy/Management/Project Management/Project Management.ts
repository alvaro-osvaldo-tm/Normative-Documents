
import { Scope_Management } from "../Scope Management/Scope Management";

/**
 * An project management iniciative entity
 * @since 0.0.0
 */
export interface Project_Management {


    /**
     * The project management inciative title
     */
    title: string;

    /**
     * The current project state.
     * @example if is active, waiting to start, finished, cancelled.
     */
    state: object;

    /**
     * What the project need to archieve
     * 
     */
    goals: Array<string>;

    /**
     * When the project starts
     */
    stars: Date;

    /**
     * When the project ends
     */
    ends: Date;

    /**
     * A variety of scopes the project wil require to be managed
     * organized by domain name.     
     * key: Domain Main
     * Value: The scope management entity
     */
    scopes: Map<string, Scope_Management>;


    /**
     * Life cycle management entity
     */
    life_cycle: object;

    /**
     * The dependencies that the project needs
     */
    dependencies: Map<string, object>;


    /**
     * Other non-mandatory resources management disciplines.
     * @example Requirements Management
     * @example Finances Management     
     * @example Change Management
     * @example Risk Management     
     * @example Time Management
     * @example Assets Management
     */
    management: Map<string, object>

    /**
     * Return the project time duration entity
     * @returns object
     */
    duration(): object;

}
