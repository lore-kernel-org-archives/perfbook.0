Return-Path: <SRS0=rne+=X7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=yeOVgoanzIjG2CC5GdErxE3pKrlOGYyD4S49VpVu/F8=;
        b=kVcbGaD+d8UXABEt9ttEiIbcswbdc19gWTJA49isPJAC988MiBe/YlyjWnW6PVJrg4
         vwE1bKp7F2MIjO0ixUfODiMhj1eW3m5DG1qyzR83jewPX/mSok+XmzmOajSRD3nA7N4+
         SWvbctj/8F2koAfv+2wawLOOzbRYThsM4lbbnBntE+sxiNOGWk9wbqCXu7liVZ8e+Prv
         5RMYHtmolDTKL95demPVGk+VlrCr2jYfOWoGKpJffM9UKDf+mjLqe2IelRzgrYQvJr3P
         huOOBxoOWMfNmME0IU5wEasWwM7l8XqjHrnJczyawx81sbGE1WNAtaZ+lqnqcXMhNaxL
         fDDw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] dyntickrcu: Apply 'cleveref' way of cross reference
Message-ID: <dd51b8e0-71b8-0214-a6a7-d48988462f52@gmail.com>
Date: Mon, 7 Oct 2019 00:18:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set continues applying cleveref way of cross reference.

Patch #1 does the most of conversion.
Patch #2 adds customized setting for Oxford comma.
Patch #3 adds macros for "lines~m through~n" type of reference to
line range. \clnrefthro is for lowercase "lines~" and \Clnrefthro is
for uppercase "Lines~".

        Thanks, Akira
--
Akira Yokosawa (3):
  dyntickrcu: Apply 'cleveref' way of cross reference
  Tell 'cleveref' to respect Oxford comma
  Define '\clnrefthro' for 'Sections~m.n through~m.o'

 formal/dyntickrcu.tex | 293 +++++++++++++++++++-----------------------
 perfbook.tex          |   6 +-
 2 files changed, 138 insertions(+), 161 deletions(-)

-- 
2.17.1
