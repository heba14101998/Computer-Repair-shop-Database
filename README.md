# Computer Repair shop Database
The owners of a computer repair shop would like to keep track of the repair jobs for computers they repair, the items used for each repair job, the labor costs for each repair job, the repairmen performing each repair job, and the total cost of each repair job.
When customers bring their computers in to be repaired, they make a deposit on the repair job and are given a date to return and uplift their computer. Repairmen then perform repairs on the customers’ computers based on the repair job and detail the labor costs and the items used for each repair job.
When customers return, they pay the total cost of the repair job less the deposit, collect a receipt for their payment, and uplift the repaired computer using this payment receipt.

# Tools

*	MySQL shell
* 	MySQL workbench
*	Sublime text editor
*	Draw.io
*	Microsoft word

# List assertions for all relationships (Optionality: Cardinality)

By looking at each relationship from Entity A to Entity B and writing out the relationship in words, using the entities involved in the relationship, the optionality, and cardinalities. Then, look at each relationship in reverse, from Entity B to Entity A, and write out the relationship in words, using the entities involved in the relationship, the optionality, and the cardinalities. 


First, we list the assertions of the 8 relationships, mentioned in the E-E matrix above, as follows:

*	A Repair Job must be conducted on only one Computer (1: 1)
*	A Repair Job may use many Items (0: N)
*	A Repair Job must be requested by only one Customer (1: 1)
*	A Repair Job must be performed by at least one Repairman (1: N)
*	A Repair Job must have made at least one Deposit (1: N)
*	A Repair Job may have made many Payments (0: N)
*	An Item may be ordered by many Repairmen (0: N)
*	A Customer must own at least one Computer (1: N)

Second, we list the reverse of the 8 relationships as follows:

*	Each Computer must have conducted at least one Repair Jobs (1: N)
*	Each Item may be used in many Repair Jobs (0: N)
*	Each Customer may request many Repair Jobs (0: N)
*	Each Repairman may perform many Repair Jobs (0: N)
*	Each Deposit must be made for only one Repair Job (1: 1)
*	Each Payment must be made for only one Repair Job (1: 1)
*	Each Repairman may order many Items (0: N)
*	Each Computer must be owned by only one Customer (1: 1)

# Indexes
*	All mentioned indexes ON UPDATE CASCADE.
*	All mentioned indexes ON DELETE RESTRACT. 

