Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=CteRO3ZpaMsP4lbUyPtwgJxoBjRyPWLUZfW41SY9waI=;
        b=jhOQvIhBXtcu1x3Ax6oUQj+bBSJ9XDQCUOqGJxRthRvjBo9aB9CGGQlsUNNzGP3+of
         mjYmmWEVoe4joUGCpz/h45jiq0Ye/GLgwgIkgMFiRcwqPQRH2efqIYPux0fZwhwMQElk
         IulWDue16QAi6vtLZ+TogN3+QHHhiWcfCyx92OMNinb3j0LhQqjI/c86ydys0mTUvXaU
         G0aO/SLAcsyQ4nrvk+LNnsAfsDWXYduaQXxZdIfGxYn1paYkwvZswBCJFUoPpw+nbmS1
         4hOAx/lwbMOVFVPnaR7fXHVnuV98lbcm50M+zwkyvLG3SqbZ5m3d9IcGuhtwKBIKPsRs
         YwAg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Add script to detect collisions in commandchars
Message-ID: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
Date: Sun, 27 Jan 2019 00:07:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I mentioned in an earlier patch submission that to add collision
check of commandchars in fcvextract.pl was on my to-do list.

It turned out that fcvextract.pl is already complicated and
I changed my mind to add a separate script to check .fcv files for
the collisions.

Patch #1 adds the script as utilities/checkfcv.pl.
Patch #2 adds the invocations of the script in Makefile. It also
suppresses the echo of commands in the recipes.
Patch #3 fixes a couple of collisions detected by the script.

The two collisions were made by myself.  This automatic check
looks promising to me.

        Thanks, Akira
--
Akira Yokosawa (3):
  Add checkfcv.pl
  Makefile: Invoke checkfcv.pl in -> .fcv recipes
  CodeSamples: Fix commandchars collision

 CodeSamples/defer/route_hazptr.c                   |  2 +-
 .../formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus    |  2 +-
 Makefile                                           |  8 ++-
 utilities/checkfcv.pl                              | 78 ++++++++++++++++++++++
 4 files changed, 85 insertions(+), 5 deletions(-)
 create mode 100755 utilities/checkfcv.pl

-- 
2.7.4

