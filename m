Return-Path: <SRS0=p/V2=F3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697207601; x=1697812401; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/CzaSpqvBzNpzON4e7rQNOacqSaCro/xPtapB+weFw=;
        b=UE+DnEaKRGCXkPMI54XYfytCnCOBw31hZJqgTCPK1W7hfRBWsTem4A8QUU0AhoXnTF
         zXHILq7TD/+xQ40ucbQ/JE9xfc/iBxqNvHHMTSCQlyxtoxQy/C5JyusWX12vQEI9by4q
         cXt5KWO0U696vSInklPLimTgv1VkzFjlhSbg5U5z+kywk51fbxh7/sjYXEhUeZQ24NoX
         rFTcPItGTc6KGVDsCgtMxUKhfOdasstKvnaIPCqQJkr0R7op5C6/Emh1MBtUnKkNHjYm
         2N49HD851wi9zOGG6DQLg9EsdRqlVckL1Jvch2u6bnwvwvDEW9ML1J76CbRJzcj4TB6U
         11xA==
Message-ID: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
Date: Fri, 13 Oct 2023 23:33:18 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/3] Work around errors of unstable Inkscape
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I expected the crashing bug in Fedora's distro Inkscape would be
resolved by the time of Fedora 39 release.
I tested Fedora 39 beta and was disappointed to see more or less the
same crashes of command-line runs of Inkscape as those under Fedora 38.

As a matter of fact, even when Inkscape crashes, the export of PDF
is complete most of the time.  So the crashing bug can be worked
around by ignoring the error code from Inkscape and continue building.

This patch set implements the ad-hoc workaround in build scripts.

As you can see in Patch 1/3, the workaround is enabled by default.
This is because enabling it won't do any harm on systems with
stable Inkscape.

I might be able to add some heuristics not to enable the workaround
for stable Inkscape installs, but that can wait.

Ubuntu releases 22.04LTS, 23.04, and 23.10 are free of this issue.

        Thanks, Akira
--
Akira Yokosawa (3):
  Ignore error of unstable Inkscape
  Ignore emergency-save SVG files from Inkscape
  Make sure all PDF conversions are complete

 .gitignore |  1 +
 Makefile   | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)


base-commit: 84759ebac65a03aa28c5b02007e6c472b3416d3d
-- 
2.25.1

