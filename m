Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50911 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751180AbcLFOH7 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 6 Dec 2016 09:07:59 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uB6E1Ygl048434
 for <perfbook@vger.kernel.org>; Tue, 6 Dec 2016 09:07:58 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 275unvaysm-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 06 Dec 2016 09:07:57 -0500
Received: from localhost by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 6 Dec 2016
 07:07:54 -0700
Date: Tue, 6 Dec 2016 06:07:57 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PULL] bib: Append DOI fields
Reply-To: paulmck@linux.vnet.ibm.com
References: <ed2fcfd1-0a00-8b8a-e106-bd715ee416d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed2fcfd1-0a00-8b8a-e106-bd715ee416d0@gmail.com>
Message-Id: <20161206140757.GF3924@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Dec 03, 2016 at 05:26:15PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Seems like you were very busy this couple of weeks at the RCU front.
> Meanwhile, I did my homework of bibliography cleanups.
> 
> This pull request consists of easy patches just appending DOI fields.
> I thought it would be easier for you to apply them to your private
> repository if I split them to individual commits.
> So there are 50 commits of one-liner.
> 
> I can squash them if you'd like them to be.
> 
> And there is no visual effect in the resulting bibliography output at
> the moment. They will be embedded as hyperlinks once we switch
> bibliography style to the url-aware "alphapf".
> 
> I'm preparing other branches to append or salvage URLs.
> Tree-wide format changes can be done later (if I can manage to write
> a script), but when I update a URL in a note field, I'll remove
> "Available:" and "[Viewed ...]", then append a "lastchecked" field.
> 
> Thoughts?
> 
>                                               Thanks, Akira

They look like great improvements!

Having them split up works best for me.  I will incorporate them, but
it may be a few days before I get to it.

My process is to pull your changes into a separate branch, apply the
changes incrementally to my source bibtex archive, use a script to pull
the changes into perfbook, and "git diff" against the separate branch
to check each step.

If you know of a better way, please don't keep it a secret.  ;-)

							Thanx, Paul

> ----
> The following changes since commit 345ba95e4a578614247a7077602026dd7f6b1dd0:
> 
>   Add Joe Duffy citations to STM discussion (2016-12-02 09:32:16 -0800)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git bib-append-doi
> 
> for you to fetch changes up to 8b3c3e02533a28e599448051bddf13e5cac615fe:
> 
>   bib/syncrefs: Append doi to Cai-DongWang1996PrioInherLock (2016-12-03 09:00:31 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (50):
>       bib/perfmeas: Append doi to Anderson97
>       bib/cyncrefs: Append doi to HagitAttiya2011LawsOfOrder
>       bib/swtools: Append doi to JadeAlglave2013-cav
>       bib/parallelsys: Append doi to GeneAmdahl1967AmdahlsLaw
>       bib/syncrefs: Append doi to Anderson90
>       bib/TM: Append doi to Blundell2006TMdeadlock
>       bib/TM: Append doi to CalinCascaval2008tmtoy
>       bib/syncrefs: Append doi to Courtois71
>       bib/RCU: Append doi to AustinClements2012RCULinux:mmapsem
>       bib/TM: Append doi to AleksandarDragovejic2011STMnotToy
>       bib/swtools: Append doi to VijayDSilva2012-sas
>       bib/syncrefs: Append doi to Dijkstra65a
>       bib/TM: Append doi to DavidDice:2010:SCA:HTM:deque
>       bib/os: Append doi to Cheriton96a
>       bib/RCU: Append doi to DinakarGuniguntala2008IBMSysJ
>       bib/syncrefs: Append doi to Graunke90
>       bib/WFS: Append doi to MauriceHerlihy90a
>       bib/WFS: Append doi to Herlihy91
>       bib/syncrefs: Append doi to AndreasHaas2013CFRelaxedQueues
>       bib/syncrefs: Append doi to AndreasHaas2012FIFOisnt
>       bib/WFS: Append doi to HerlihyLM02
>       bib/TM: Append doi to Herlihy93a
>       bib/RCU: Append doi to ThomasEHart2006a
>       bib/syncrefs: Append doi to WilsonCHsieh92a
>       bib/refs: Append doi to VanJacobson88
>       bib/TM: Append doi to ChristianJacobi2012MainframeTM
>       bib/TM: Append doi to SanjeevKumar2006
>       bib/RCU: Append doi to Kung80
>       bib/syncrefs: Append doi to Lamport74a
>       bib/refs: Append doi to McKenney90
>       bib/perfmeas: Append doi to McKenney95a
>       bib/syncrefs: Append doi to McKenney96a
>       bib/syncrefs: Append doi to MellorCrummey91a
>       bib/os: Append doi to McKenney92b
>       bib/os: Append doi to McKenney92a
>       bib/hw: Append doi to MiloMKMartin2012scale
>       bib/TM: Append doi to PaulEMcKenney2010OSRGrassGreener
>       bib/WFS: Append doi to MichaelScott96
>       bib/os: Append doi to McKenney01e
>       bib/parallelsys: Append doi to Olukotun96
>       bib/TM: Append doi to ChistopherJRossbach2007a
>       bib/hw: Append doi to DanielJSorin2011MemModel
>       bib/syncrefs: Append doi to Segall84
>       bib/parallelsys: Append doi to DuaneSzafron1994PEMPDS
>       bib/TM: Append doi to JMStone93
>       bib/TM: Append doi to Shavit95
>       bib/syncrefs: Append doi to Takada:1995:RSN:527074.828566
>       bib/WFS: Append doi to Valois95a
>       bib/syncrefs: Append doi to Wisniewski94
>       bib/syncrefs: Append doi to Cai-DongWang1996PrioInherLock
> 
>  bib/RCU.bib         |  4 ++++
>  bib/TM.bib          | 11 +++++++++++
>  bib/WFS.bib         |  5 +++++
>  bib/hw.bib          |  2 ++
>  bib/os.bib          |  4 ++++
>  bib/parallelsys.bib |  3 +++
>  bib/perfmeas.bib    |  2 ++
>  bib/refs.bib        |  2 ++
>  bib/swtools.bib     |  2 ++
>  bib/syncrefs.bib    | 15 +++++++++++++++
>  10 files changed, 50 insertions(+)
> 

