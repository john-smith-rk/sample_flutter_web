import 'package:equatable/equatable.dart';
import 'package:key_fields_com/model/founder_person_model.dart';

abstract class AboutState extends Equatable {
  List<FounderPersonModel> founder = [];
}



class InitialState extends AboutState{

  InitialState(){
    FounderPersonModel founder1 = FounderPersonModel("Kenny Tan", "FOUNDER & CEO", "Kenny Tan is the Founder and General Manager of KEYfields Pte. Ltd. Kenny is the driver of KEYfields. He leads the group management. From a one-man operation, Kenny expands the business to be one of the leading IT companies in Singapore providing a range of software solutions. He has 19 years of experience in IT industry in Managing Business, Software Sales and Consulting, Design & Project Management. He was formerly a CIO in Rehau Asia Pacific, General Manager for IBS Asia and Head of IT for IDS Logistics, Singapore. Kenny holds a Bachelor of Science in Information Systems from the Thames Valley University, London.","assets/images/kenny.jpg");
    founder.add(founder1);

    FounderPersonModel founder2 = FounderPersonModel("Patrick Yeo", "CO-FOUNDER & HEAD OF SOLUTIONS", "Patrick Yeo is the Co-Founder and Head of Consulting of KEYfields Pte. Ltd. Patrick is the brain of KEYfields’ suite of solutions. He leads a team of consultants for the delivery of Application Consultancy, System Design & Development and Project management. He has over 19 years of industry experience in business system consultancy and implementation of logistics solutions. He was formerly working as IT Manager in Keppel Logistics and Senior Operations Manager in IDS Logistics. Patrick holds a Bachelor of Science in Computing with Management from the University of Bradford.","assets/images/py.jpg");
    founder.add(founder2);

    FounderPersonModel founder3 = FounderPersonModel("Eliza Yeong", "HEAD OF DELIVERY & OPERATIONS", "Eliza is Head of Operations and Delivery of the Group. She has been primarily responsible for managing the administration, commercials and human resource functions of our Group. Eliza is also responsible for the delivery team of the group to ensure projects are delivered on time, on budget and on target.","assets/images/ey.png");
    founder.add(founder3);

    FounderPersonModel founder4 = FounderPersonModel("Li Ha Chan", "HEAD OF SUPPORT", "Li Ha is the Head of Support. She is responsible for the management of a dynamic team of Customer Care Consultants to keep customers across KEYfields’ Suite of Products & Services highly satisfied.","assets/images/lh.jpg");
    founder.add(founder4);

  }

  @override
  List<Object?> get props => [founder];

}

class ExpandCollectState extends AboutState{

  int? index;

  ExpandCollectState(this.index){
    if(index != null) {
      if (founder.isEmpty) {
        InitialState();
      }
      // founder[index!].isExpanded = !founder[index!].isExpanded;
    }
  }

  @override
  List<Object?> get props => [founder];

}