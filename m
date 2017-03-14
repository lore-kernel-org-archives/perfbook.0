Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=EPMqxerMo2B9C9CI8bRdn6TMvBiI9FAlFvTjmgypYhw=;
 b=tFtmPHhvn+MfIolbr/ZPb5MEm4P6ooMRZEJsLJOBU20u5LrSrryQY7ApZY4q3KZy3T
 F0Ww7b8N6HynscVeNYX6adqqwrNFcmqgrqR5B5y2s4ASiudNe5ok5v0DAz2hS8+yW7Ts
 wkZrcw6/MhPl4eOuX0zcBXDe0cUm6gDnzAi9H4OeEMY7lUU3qFQPpaecqjk7+w0e98AK
 u/gYupwn3eaEu+cDcB1te7XegXh5Fpq0bag2qsU0OrRVGBe8qF2E9HrfHZH6mbFJn01e
 hw0EqMJeNEhssPtilOyh+VhBr6PsEyyTuht/WUXhWuKSrzrmizILH1RSbuzjhhIHCpRq
 uyKQ==
Subject: [PATCH v2 0/6] Misc updates
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
Date: Tue, 14 Mar 2017 21:37:15 +0900
MIME-Version: 1.0
In-Reply-To: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ad3fca471bd3a6178f7988bbe5c9ab903f86722a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 14 Mar 2017 21:30:58 +0900
Subject: [PATCH v2 0/6] Misc updates

Hi Paul,

I fixed grammatical errors in commit logs.
No change in diffs.

                                 Thanks, Akira
--
Akira Yokosawa (6):
  runlatex.sh: Refactor further
  formal/spinhint: Fix typo
  formal/spinhint: Adjust option of enumerate list
  formal/spinhint: Reference by Figure labels
  advsync/memorybarriers: Reference by Figure label
  advsync/memorybarriers: Distinguish 'CPU family' from 'CPU'

 advsync/memorybarriers.tex | 13 +++++++------
 formal/spinhint.tex        | 16 +++++++++-------
 utilities/runlatex.sh      | 27 +++++++++++++++++----------
 3 files changed, 33 insertions(+), 23 deletions(-)

-- 
2.7.4


