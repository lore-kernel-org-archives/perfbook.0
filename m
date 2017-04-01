Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=Ui01qcrV9RP0nq6bg+OiE+gU7V0QqQ5jGa3uS1lg1Y4=;
 b=J1/nNGptRvt65y4fKLz62fYc77dAJT7Y5l7yWqBl00hZa/d0CwIh/qZt0AU7QsPGwX
 oHKjVQDqHznLwgkIv8ZMtBhmIYeX/X7dd/PL/ivIyzKDN/dPRPwJSf+f8T3AlSEG4pbh
 3bqg8lRwEzXvJHJUrJM3+ieAG+Y8vog/3LmCaOFLrvRslXawnbS18IfBx7sRl2b0KUbE
 ja8FwfFH2/GaupeT1jUN4acScxkGCP9aOi//dhayYeSrN0V6wH0Ko2EKPZmJXUxkwd5d
 lDwoX9ZvJAi944AHDKJs6U06BMCGMGPxmJSnMsjdWnmt/gI5bvUw+QnXCMtSlq18T716
 i4nA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH 00/12] advsync: Rename LOCK/UNLOCK to ACQUIRE/RELEASE
Message-ID: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Date: Sat, 1 Apr 2017 11:09:27 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8aa4157fbed720fd3e8a259de620184003bf09da Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 1 Apr 2017 10:48:45 +0900
Subject: [RFC PATCH 00/12] advsync: Rename LOCK/UNLOCK to ACQUIRE/RELEASE

Hi Paul,

This series mostly corresponds to commit 2e4f5382d12a ("locking/doc:
Rename LOCK/UNLOCK to ACQUIRE/RELEASE") in Linux kernel repository.
Although Documentation/memory-barriers.txt has a lot of updated
contents after the import to perfbook, this series basically
does substitution of existing "LOCK/UNLOCK".

Patches 1--3 do simple substitutions.
Patch 4 does another replacement not included in the original commit.
Patch 5 is an attempt to add a footnote on "LOCK/UNLOCK" wording. You
may want to rewrite the text of the footnote.
Patch 6 replaces some of "the" with "a/an". I think they are reasonable,
but this is from an non-native POV. I might missing something.
Patch 7 is to go along with current wording in memory-barriers.txt.
Patch 8 is a big patch in line count, but it just adds proper nbsps
(in LaTeX sense).
Patch 9 adjusts the position of a footnote appended in the previous
patch set.
Patch 10 is an independent trivial typo fix.
Patches 11 and 12 are tweaks for a better layout.

                                      Thanks, Akira
--
Akira Yokosawa (12):
  advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 1)
  advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 2)
  advsync: LOCK/UNLOCK -> ACQUIRE/RELEASE (part 3)
  advsync: More replacement to ACQUIRE
  advsync: Add footnote mentioning LOCK/UNLOCK wording
  advsync: Modify usage of definite article
  advsync: Substitute 'guarantee' with 'implication'
  advsync: Properly use nbsp
  advsync: Move footnote on transitivity forward
  advsync: Fix line number called out
  advsync: Add extdash shortcut
  advsync: Avoid indent after minipage

 advsync/memorybarriers.tex | 504 +++++++++++++++++++++++----------------------
 1 file changed, 254 insertions(+), 250 deletions(-)

-- 
2.7.4

