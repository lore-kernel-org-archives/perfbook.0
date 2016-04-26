Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=6CZscFnaZ+a6lGrMkmJ0ant0LJgCkkhV5n1gOQcsFwo=;
 b=l6zezI4tOerW3JsqhNFIfVp33X22b4g3OM2z0x7LBZYO1vDtbPewltH0xL+3kBrg+l
 AE+UkxOj8evXMXKiJS1RJuAxlydSL0og+8nLXcQ5cTR3QHCRSCxrZdGmTm4AkvVdRcWb
 Mn3FBHRW08BboNI7AgP4Zbl44j1Z8/3Ui3G0xWztVU9npLEBpfzpN0QV8FWxXnIWQ06V
 QZ5mDadEAADO2wzUuXomvMt8zy/YY9gxi6cRdgctZoVlHkcNwVGi6y9cGEU4xUboc+uL
 Vap0wvVtO77PcTIO6lyQ/e+vyremd0XNp0c37FYKyt0XI1a0zMWMxH6QPVta7kcEBBaM
 nLXA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/2] SMPdesign: fixup trivial nitpicks
Date: Wed, 27 Apr 2016 08:33:13 +0900
Message-Id: <1461713595-29898-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset contains fixup of trivial nitpicks that found during translation
of SMPdesign/ directory.

SeongJae Park (2):
  SMPdesign: add missing tildes
  SMPdesign: keep consistent expression

 SMPdesign/SMPdesign.tex     | 6 +++---
 SMPdesign/beyond.tex        | 6 ++++--
 SMPdesign/partexercises.tex | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
1.9.1

