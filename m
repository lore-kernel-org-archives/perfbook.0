Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=5jt6pVRDPtIgNpYqd5exTCUKWjZtvknk0GG7j5jmRpg=;
 b=XtrExy7qPy00PnBZ9FV9cad3fStG4z7hsKGVb0EJXZeKW0C7GQCLk+xFB10BqB8X9R
 1cVb4BE+QpEmoYV5sQJJO6RBvHcNGOsxxWu2gAWS1/8KJMCDvuhJHOitqMKQfYFUyvQ4
 QGkuK5Gaj+0MZADwBx5BHmD7+QZkmD72mgCO5+KIhoVJpf3U2WfMzKELDObLW4Oj0+s2
 XNQR88a8OujY2sAWQu2g8QVx3GKeKIkpKCJOpd9HyOr9Hc9aU7vRsmIyufEG3MhnpM7B
 WSYluan7ekBz6TQEr2iT4uDPcXqudL3FkT5iCr4hyVIUAnWAGip7Moob4S5Jl11RweM7
 cf7g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Add rules in hyphen2endash.sh
Message-ID: <2247f46e-3c0a-89a5-f13f-b9ba591bc570@gmail.com>
Date: Sun, 18 Sep 2016 23:24:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ec548ecfa8846f40731a0945853d3ac9018b4d71 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 18 Sep 2016 23:09:34 +0900
Subject: [PATCH 0/2] Add rules in hyphen2endash.sh

This is an update of scripts added in commit dd08907f289d
("Trial of replacing hyphens with en-dashes for number ranges").

1st patch adds patterns for the following:
  o CPUs~nn--mm
  o \co{xxx}--\co{yyy}

It also fixes typo in the authors email address.

2nd patch merges several rules by using "[abc]" regex patterns.

Akira Yokosawa (2):
  hyphen2endash.sh: Add substitution patterns
  hyphen2endash.sh: Merge subst patterns

 utilities/dohyphen2endash.sh |  2 +-
 utilities/hyphen2endash.sh   | 23 +++++++++++------------
 2 files changed, 12 insertions(+), 13 deletions(-)

-- 
1.9.1

