Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686503773;
	bh=sFcRMY/2f1azJghFa/KsAkf+vVENjgzvUQZ/dubVDxY=;
	h=From:To:Cc:Subject:Date:From;
	b=C4/i6Gr6PWZWJXfgQKAhPogA2/kdwBxozJe6X1mscxRTzgX/cYOFlwdw2MiqWuGVP
	 eKZNRt8wLZAXUvl2uE2H626Rx2v+sZDvM56Sey6u+6YWOhh8QiYmi75V4hbxel0No4
	 N5f7Wl9KoPruimcp2W5ikXo/GJCfu33Yf4I6i9ETsaYdIx13SedGVWwkB9YecSqcjf
	 TG+CbxHn6OslyJm2FFiAsYRruJ/6W9n2IlXBqC51zptd6A8xFjepyseSp3Hmn/dM6z
	 wtgvhgUWDC9voUH2H/g/dS5jVGbVvGj1EQ+aYVQIf671P2fG/ywrAXmK0+Xunt5DJr
	 Ej7eBLBLZxKZg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 0/2] advsync: Minor fixups
Date: Sun, 11 Jun 2023 10:15:04 -0700
Message-Id: <20230611171506.32033-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

This patchset contains trivial fixups for advsync/, which found while
doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (2):
  advsync/rt: Update path to kernel-per-CPU-kthreads document
  advsync/rt: Mention the tree of Documentation/ directory

 advsync/rt.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.17.1

