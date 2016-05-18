Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=cjRyVviwPPXEafcUKZPHr6OXdimuKv98+n3qPAwI21g=;
 b=YNThPXKQPu+hIAAQyNvDbSFeX2MogV1HklMgYbZ07qzsRtUbRF4uPL3kjy9y0Mh3if
 hCenEz2rqQL7BQB7PwYvq3yeJnwOFJA46vZa6WJDXY8oBlaCjh9tnjmnWly2dDfBeQIA
 B2XnQmve2va8EnGKAwdsZr/IxiD9h8xzUGyEUPKWmqRXQX9146ZQLePmfiqWvoe/i+Op
 CTsNMFyCnIaqnx88RYrKvpqgWAMfElRy6AioAqRSIWMNl69FtxP0J4MinVb7BSo7OfJU
 wRsyIVS6DXBZIYNhb+zdszzxs6GvPtd/OYgQKY1H/Pcq+GjA/7XMe/+VrpCGieiop0XS
 4XeQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/2] locking: fixup trivial nitpicks
Date: Thu, 19 May 2016 07:53:58 +0900
Message-Id: <1463612040-21728-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset contains fixup of trivial nitpickes that found during translation
of locking/ directory.

SeongJae Park (2):
  locking: use consistent expressions
  locking: fix typos

 locking/locking.tex | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
1.9.1

