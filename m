Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=yGa7gmC35Begd+cXmJjgTXu+eB6vyXZT6hakwKRy92w=;
 b=DFtE1sppDAenuz1l/S1PXL8sSxlSdV3uPJ2VvBT9zj/3jRvudEexFvNFs/JA+xQt8A
 DpCPbOVPXsEC+Cd/OQHptoVdH5l9oHmQMRQriEFNzZRFidoVf7+X1ERLg8MfbwdYa/qf
 213kIgbYPyZiiX1PVInsSs4a8HStoySfUolLfKIbukSLxGN2exmsRgJvltJqaBY6S3ZT
 4ojcDk44ffgXMKh0/KBrzzlD4Bomv/aX6nXoz4l1TYg5wRC44wWyAnxdyQBt5RKX+0Ex
 InXs+HMBUFeAAJerkC7gVTCl+EjaCnoCoNNTMp4rfZjxRHAHT3RVzsG1mavLo5oCzdQ4
 plBA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Promote target 'mss' to default
Message-ID: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
Date: Thu, 5 Jan 2017 09:27:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi, Paul

As I mentioned, I'm submitting a patch set to switch default
monospace font to "couriers" (courier scaled).

Patch 1 does the switch.
Patch 2 adds a new target "help" that explains various targets.
Patches 3 and 4 revert manual fontsize tweaks.
Patch 5 encloses a short verbatim definition in a minipage, It was
a bit too wide with non-scaled courier, but now it is safe to
be indented as a paragraph.

                                        Thanks, Akira
--
Akira Yokosawa (5):
  Promote target 'mss' to default
  Makefile: Add target 'help'
  Revert "after: Tweak font size of Figure A.2"
  Revert "formal/dyntickrcu: Adjust font size of sample code"
  toolsoftrade: Enclose short verbatim in minipage

 Makefile                      | 45 ++++++++++++++++++++++++++++++++++---------
 appendix/questions/after.tex  |  2 +-
 formal/dyntickrcu.tex         |  2 +-
 perfbook.tex                  |  2 +-
 toolsoftrade/toolsoftrade.tex |  4 ++--
 5 files changed, 41 insertions(+), 14 deletions(-)

-- 
2.7.4

