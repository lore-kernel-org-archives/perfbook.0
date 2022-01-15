Return-Path: <SRS0=fdso=R7=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNQ0leWCRiKs/lm4z/FQpKuDDueQytQsoDBpLig/6AI=;
        b=ZIxA4Pl9e+oinDMrN7x5FJkJ49i7AKvs9nheAggmu3lEwYpUzFFmSjTCVlWjKrfyKV
         bP45oJDOGRTlaQor0yq0WMmGeztYEuCvQshuEBjPPMO29jcsHfrrZhMuJxHA8UGXHyAg
         epAAlfEnfxV07s/3Mq4MD0wcqe1R9K97VR7lX1CAhfknNPqnMRpawlhJysxBBd485bBa
         okBVwgxH2iVf5C2j6Auh+0xlDDQaXDZvAFzLWfwzPJl84ffDFcd+1kcZqwTTm8I3Whmq
         EsxsHOrAbecEVsmQcXMqCpMjsCRq2bry3bnhjcJxA76eXbBbKWUeZ9CZxX1MhkJZ+vvm
         s6nA==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] make a ref item (Liang2018) better
Date: Sat, 15 Jan 2022 12:06:06 +0800
Message-Id: <20220115040606.22618-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com, luyang.co@gmail.com, perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

make the reference item: Liang2018 better by following the style of
https://ieeexplore.ieee.org/document/8341980

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul and Akira

I think we could make the reference item better by following
the style of https://ieeexplore.ieee.org/document/8341980

and I invoked 'make' before submitting ;-)

Thank you for your constant encouragement ;-)


Thanks
Zhouyi
--
 bib/swtools.bib | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/bib/swtools.bib b/bib/swtools.bib
index 31ce0025..cab1909d 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -737,8 +737,11 @@ Michalis Kokologiannakis",
 @inproceedings{Liang:2018:VTB,
  title = "Verification of Tree-Based Hierarchical {Read-Copy Update} in the {Linux Kernel}",
  author = "Lihao Liang and Paul E. McKenney and Daniel Kroening and Tom Melham",
+ day = "19--23",
+ month = "March",
  year = "2018",
- booktitle = "2018 Design, Automation {\&amp;} Test in Europe Conference {\&amp;} Exhibition, {DATE} 2018, Dresden, Germany, March 19--23, 2018",
+ booktitle = "2018 Design, Automation {\&} Test in Europe Conference {\&} Exhibition (DATE)",
+ address = "Dresden, Germany",
  url = "http://www.cs.ox.ac.uk/tom.melham/pub/Liang-2018-VTB.pdf",
 }
 
-- 
2.25.1

