Return-Path: <SRS0=LKEQ=FV=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696662231; x=1697267031; darn=kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Djq8npD9AGIYjWC5nvc76BM/pfdjq9/+zF639W0y468=;
        b=SAKsnEk0FDAfVsUtaRZ4DKQke6dgoWrmQvie+Ue+z7nFMM3g7cAVwqx+weQePl9tbJ
         coDeW8REBo9LeraJetTn+faKHyeu/eySztuIcX+fx/gLPKILq9kI3KEJmAty+pTieIu/
         kAlTF/H5QoAgvMx/9i/j9UHpCPGEsiIyWRVpgvZZJc0TK+cDfXbhC8iwDBn6Xv6+Kr6e
         Nne++5f3Xpqbcrj+9qQMbfDvSFyxwnuKTTltV57yAa1cCcGslXH1NpFVoS+wZjLGno0K
         0bTiMBcRv8wG1H119FWU2HtZSVP+bxR7gUd0CccYLrzm1qQPidb8hiNyYWt/TP3oSGVu
         uc2A==
From: zhouzhouyi@gmail.com
Subject: [PATCH perfbook] bib/TM: trade marks should be upcase
Date: Sat,  7 Oct 2023 15:03:30 +0800
Message-Id: <1696662210-32611-1-git-send-email-zhouzhouyi@gmail.com>
To: paulmck@kernel.org, akiyks@gmail.com, perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

I think trade marks should be upcase.

Thanks Zhouyi

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
 bib/TM.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/TM.bib b/bib/TM.bib
index 2bd83676..41826a1e 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -1067,7 +1067,7 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
 
 @article{Le:2015:TMS:3266491.3266500,
  author = {Le, H. Q. and Guthrie, G. L. and Williams, D. E. and Michael, M. M. and Frey, B. G. and Starke, W. J. and May, C. and Odaira, R. and Nakaike, T.},
- title = {Transactional Memory Support in the IBM POWER8 Processor},
+ title = {Transactional Memory Support in the {IBM} {POWER8} Processor},
  journal = {IBM J. Res. Dev.},
  issue_date = {January/February 2015},
  volume = {59},
-- 
2.34.1

