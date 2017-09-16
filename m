Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=89+xJef/5WfJmYM5FNV27EhU58Jc2J1/w7fDEuzqI8Q=;
 b=Ac0IZdqcZ8UWj8RhE4D9SCSPO5NA0cRk/JDbtBXcvaUkvF04e/akwDSXZT3kos74V4
 zrkiixDWBgHKG2NV4Wl9gaUBnWW0SSb5s5TJ7pxU5NfA3/PFy+myQO4w9nJ7C/Ft0RMt
 OEBvd/q0zJczDBAtXpdr/FwXsfe1K3wM7PfrMuczt/D6VzRwRpcMfpo8d1F4Nq8Kp0ri
 jfUUpSlHx1nH/D7Vxc0TL46hX7m/XCYPHTASN/DtvOSyBaw3WHO3vIUpJSjOvNvyF02W
 PnzIslEvAij0jXyzCFVjiRHM30+QvNwnropsTrs4/8E90WciXhun8aukgBVrXEUfTubE
 iUjQ==
Subject: [PATCH v2 0/5] memorder: Miscellaneous fixes
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
Date: Sun, 17 Sep 2017 00:06:02 +0900
MIME-Version: 1.0
In-Reply-To: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 16 Sep 2017 23:39:11 +0900
Subject: [PATCH v2 0/5] memorder: Miscellaneous fixes

Hi Paul,

(Sorry, I messed up 2/5 in v1. Retrying...)

This patch set consists of small fixes in memorder.

Patches #1, #2, and #3 are trivial fixes.

Patch #4 fixes a recursive reference within the chapter. I chose
Section 14.1, but there might be other choices.

Patch #5 might be a wrong guess on my side. I have not consulted
any document regarding PA-RISC arch or its CPU implementation.
Please apply it if it is the right guess.

       Thanks, Akira
--
Akira Yokosawa (5):
  memorder: Adjust hspace of table 'Summary of Memory Ordering' in 1c
  memorder: Fix usage of \IfInBook macro
  memorder: More reword to 'full-strength non-void RMW'
  memorder: Update reference to memory-barrier primitives
  memorder: Fix table of 'Summary of Memory Ordering'

 appendix/styleguide/styleguide.tex |  2 +-
 memorder/memorder.tex              | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.7.4



