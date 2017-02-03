Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f43.google.com ([74.125.83.43]:34881 "EHLO
 mail-pg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752248AbdBCOEP (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 3
 Feb 2017 09:04:15 -0500
Received: by mail-pg0-f43.google.com with SMTP id 194so7053407pgd.2 for
 <perfbook@vger.kernel.org>; Fri, 03 Feb 2017 06:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=c4dnpaw7ObxsOFSb22cQStC6EalJB2OLAyg7LyKENMc=;
 b=gtDlBy2lOrFXvjyU4y862W69/9f081+pwZM7N5LcCbNaA9IWiIHYV0QrmG9o/IKyXz
 GRGNQmrCvqMVpoEKTRB54GvcHPptxUzKzXXXVkuADwCGEKSXDx8v0XW2OJqxcRiSIcSu
 kN0tItamuZcDqJ9ugD7cm+qqQaVmpP1g7gr4KxCSEnTbiMfZRyP+x1a8WK+thtCPkSXU
 W5DxWmdcqJAFGkGi6WaTaSQzQNftE3Ks4agyWXqwRzkN5o7GSJVKxMgcVw5vNn9uFca+
 s0BrWYfy8vD+F/HMp5tr8Z9he4awAhg2jeOLWi4vNrwzT66xmk/EIZUnqAl7AYCFhDGc
 ruQQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/7] Bibliography update round 4
Message-ID: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Date: Fri, 3 Feb 2017 23:04:13 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From d6a74ae528d3d8134d4d21f385c34745d5a31a7b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 3 Feb 2017 22:56:57 +0900
Subject: [PATCH 0/7] Bibliography update round 4

Hi Paul,

This time, I picked up remaining patches to salvage broken urls.
They are mostly straightforward updates.

                                     Thanks, Akira
--
Akira Yokosawa (7):
  bib/TM: Replace url with doi of DaveDice2006DISC
  bib/swtools: Salvage url of DouglasEngelbart1968
  bib/RCU: Salvage broken url of McKenney01a
  bib/os: Salvage url of Molnar00a
  bib/hw: Salvage url of CSIRACMuseumVictoria
  bib/syncrefs: Replace broken url of radovic02efficient with doi
  bib/syncrefs: Replace broken url of radovic03hierarchical with doi

 bib/RCU.bib      | 7 ++++---
 bib/TM.bib       | 4 +---
 bib/hw.bib       | 6 +++---
 bib/os.bib       | 5 +++--
 bib/swtools.bib  | 6 +++---
 bib/syncrefs.bib | 4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.7.4

