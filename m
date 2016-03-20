Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=yOx9SpJ94g43rzj+h9KR4iFQums6i/sP461EsBJl7y8=;
 b=Kb5C5m9V3rYeESqEZeXRi3z7SHloo0qjqWKSbRvJirnI8DF7c+emofpCtJBe6U6FMR
 uOppDdzD35P3Rq/A3XSGD6QxFdUICM8MPyUwWkQurOYEe9x7wDcrZur1HO63QDzJPlTh
 2LGvjJ6E6HRAqP3RRy91pvyvSog1iGn/sTK8Ota/sWcmxAWVWaYvqsNT0v0XhCh8lXI+
 0d97zoBzvg+nOU7dmPV7Q2XAoe21Xj0jrGw4sKk2Fvl1jAcxfblLvd4oce/bGVx91uBy
 QNkhBJ/1bCO0S9KEGgFuChlvQXOAsG00Ef48Zubn6UUEzrPONWNyAbT/6IfmA1irvod7
 dAjg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/3] polish `Why Memory Barriers?` appendix
Date: Sun, 20 Mar 2016 09:24:18 +0900
Message-Id: <1458433461-20936-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset polish `Why Memory Barriers?` appendix by fixing trivial nitpicks
that found while translating it.  It fix trivial and evident typos, make terms
to be used consistently, and finally proposes removal of a sentence that looks
outdated.

SeongJae Park (3):
  whymb: fix trivial typos
  whymb: s/write buffer/store buffer
  whymb: remove ARM's short multi processor history description

 appendix/whymb/whymemorybarriers.tex | 92 ++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 47 deletions(-)

-- 
1.9.1

