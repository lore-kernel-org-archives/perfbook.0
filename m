Return-Path: <SRS0=U30B=6I=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJZ2a9l7iWI0p6riKMtVxkQEUeSjJOG7LhaoYHkJFNs=;
        b=RW61Ka5mmbxgc6LA21vw9bekQaPKUKilo3ilAG5Od3gGUjeWjX9GuQ+6T5JHxZ4mbG
         Wrd5tUfI0xuDWyy/6XPvmkcV8lJy17Voj9QkLQsqRXeM1dLyVy7G/YKFUlaa7hXcWjzw
         IN6V2OrjbWP8DFYyr2DNzD+HE7TeejDFtqDOMkikcWvrH03CMJ2wvrWgpX+nGoIFrj19
         VLBaXTELDDtZxXw7Xbm9Lzynghoi097+cWekRG+uv1ieUldmBgtn9wg5cl67pdr3q03A
         ZnnfcSNt/bNYBO/ptujF3Twq2DGNEHrYFkGuP+T1tSUf6DcWYnPM6bEP2dUSpySG3rGD
         m5eg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 0/4] debugging: Trivial fixups
Date: Sun, 12 Feb 2023 08:56:26 -0800
Message-Id: <20230212165630.26268-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj@kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Changes from v2
- Fix subject of patch 1 (Akira Yokosawa)
- Remove redundant following sections intro instead of making it
  explicit (Akira Yokosawa)

Changes from v1
- Use 'qco{}' for quoted strings (patch 1, 2) (Akira Yokosawa)
- Explicitly distinguish section and subsection (patch 4) (Paul E.
  McKeneeny)

-----

This patchset contains trivial fixups for debugging/, which found while
doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (4):
  debugging: Use \qco{} for 'time' output examples
  debugging: Use \co{} and \qco{} for 'git' and 'Fixes:', respectively
  debugging: Remove unnecessary space in a sentence
  debugging: Remove redundant following sections introduction

 debugging/debugging.tex | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

-- 
2.17.1

