(find dto's role playing system)

(2020-02-16 23:58:15 <dmiles> so i thin its Jenkins that has the best build
      threading support
2020-02-16 23:58:30 <aindilis> oh you want me to jenkinsify this as we
      discussed a while back?
2020-02-16 23:58:34 <dmiles> or whichever CI
2020-02-16 23:58:54 <aindilis> yeah sorry I never got around to doing that,
      I've been more productive lately though
2020-02-16 23:59:00 <aindilis> this is the ideal time to do such a thing
2020-02-16 23:59:07 <dmiles> i started to do it .. it be someting that RLa's
      blog would cover
2020-02-16 23:59:15 <aindilis> do you have Jenkins supprot or do I need to
      write the autotest stuff?
2020-02-16 23:59:35 <dmiles> (he jsut shows how to connect prolog test to some
      CIs)
2020-02-16 23:59:50 <aindilis> PLUnit -> AutoTest -> TAP -> jUnit -> Jenkins
2020-02-16 23:59:55 <aindilis> kk I'll look
2020-02-17 00:00:09 <dmiles> it just need the servers setup and to have
      certain .sh files invoked
2020-02-17 00:00:18 <dmiles> (at minumum)
2020-02-17 00:00:34 <aindilis> okay adding to to.do list then, I will)

(2020-02-16 18:13:52 <dmiles> code is here:
      https://github.com/TeamSPoon/CYC_JRTL_with_CommonLisp/blob/master/platform/site-lisp/e2c/export.lisp
2020-02-16 18:14:17 <aindilis> ty!
2020-02-16 18:14:37 <dmiles> before using it . .i use:
      https://github.com/TeamSPoon/CYC_JRTL_with_CommonLisp/blob/master/platform/site-lisp/e2c/const-renamer.lisp
2020-02-16 18:14:52 <aindilis> ah
2020-02-16 18:14:53 <dmiles> that is a thingy that renames the cyc constants
      to alline easier with PRologCYC
2020-02-16 18:14:59 <aindilis> nice
2020-02-16 18:15:30 <aindilis> also, quick question, are BTs in scope?
2020-02-16 18:15:36 <dmiles> it analizes the collections  (#$Action "act"
      "tAct" "iAct_")(#$Goal  "goal" "tGoal" "iGoal_" )(#$Capability  "cap"
      "tCap" "cap")(#$IBTContentType "tIbo" "tIbo" "ibo")(#$Event  "tEvent"
      "tEvent" "iEvent_")  (#$Situation  "state" "tState"
      "iState_")(#$FormulaTemplate  "ui_" "uiTopic_" "iUI_")(#$Topic  "ui_"
      "uiTopic_" "iUI_")(#$PhysicalPartOfObject "tPartType" "tPartType"
      "iPartType_")
2020-02-16 18:15:36 <dmiles> (#$SpecifiedPartTypeCollection "ttPartType"
      "ttPartType" "tPartType")(#$OrganismClassificationType  "tTypeOf"
      "ttTypeOf" "tClassificationOf_")(#$ConventionalClassificationType
      "tTypeOf" "ttTypeOf" "tClassificationOf_")(#$SpaceRegion "tPlace"
      "tPlaceLike" "iLoc_")(#$TwoDimensionalThing     "tPlacePartOf"
      "tPlacePartOf" "iLocPart_") ;; (#$AbstractVisualStructure "tPlacePartOf"
2020-02-16 18:15:37 <dmiles> ttPlacePartOf" "iLocPart_")
2020-02-16 18:15:37 <dmiles>  (#$OpenGISGeometry         "tPlacePartOf"
      "tPlacePartOf" "iLocPart_")
2020-02-16 18:15:49 <aindilis> kk
2020-02-16 18:15:53 <aindilis> brb 1min
2020-02-16 18:16:28 <dmiles> so if soemting is an instance of OpenGISGeometry
      it is prefixed with iLocPart_
2020-02-16 18:17:00 <dmiles> Superclass, Subclass, Instance = "tPlacePartOf"
      "tPlacePartOf" "iLocPart_"


(https://github.com/TeamSPoon/CYC_JRTL_with_CommonLisp/blob/master/platform/site-lisp/e2c/const-renamer.lisp)
 (https://github.com/TeamSPoon/CYC_JRTL_with_CommonLisp/blob/master/platform/site-lisp/e2c/export.lisp)
 (export OCyc to Prolog)
 (make tutorial on how to install / use)
 (write the portable Cyc export framework)
 )

(2020-02-16 18:18:32 <dmiles> <aindilis> also, quick question, are BTs in
      scope?
 2020-02-16 18:18:54 <dmiles> PRoably will have to add those a couple months
      from now when i have time
 )
