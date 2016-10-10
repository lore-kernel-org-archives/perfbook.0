Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=YS0be4IH6TDjQAYLPj+qMhJ105qL/u5+e9G99wtHhUY=;
 b=TAIgauaEHL1caZBSupG+Wmn0GrfYefVxyYgaNW2Uq16ZiGs2nhMjJsYTCIWv0EwCN9
 2ty+yPVJIOl/vR6Mzi5iIsnjUnjN6i8hxI9v+SyLEiAUv2kEO+vGykwJOcGVaffdwDeI
 Yne0fCtp0WiTwherlqJj2V4NsKnD2V4/moQM/7P7BY+obuCKJZKYZ+/wxisut6b3+9fx
 FX2H79JFhMzLVQHWpYuHDoQ24caGMoG29KCsLYQQ5KXZVE9FuZNURjwndBl4yrLJIUzq
 Lczk6l9JSRb5Ha1GN87Ap9V+RJe/Ue+Vx6GOXr3AdmwHfSEh9D7LT5mpUOxUXUkiXRMr
 xS2w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/8] Fixups for together/ directory
Date: Tue, 11 Oct 2016 08:07:30 +0900
Message-Id: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset fixes few trivial problems under together/ directory that found
by Korean translation work.

SeongJae Park (8):
  together: Add missing NBSPs for line numbers
  together: Fix a wrong code line quotation
  together: Fix wrong function name quotations
  together: Add a missing comma
  together: Append `()` suffix to function name quotation
  together: Fix a wrong field citation
  together: Fix a contextual typo
  together: Improve struct field quotation readability

 together/applyrcu.tex | 14 +++++++-------
 together/refcnt.tex   | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.10.0

