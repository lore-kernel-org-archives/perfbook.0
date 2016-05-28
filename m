Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=JDP6CvnxtL8r3nmVaB+1tlIKsWhiAJoCX2W+WgKuXdA=;
 b=Wy5YP7/8H9C7056JeJJTYSjcXqk/oxf6Y2u8eS7h9jeDChRyTtRpPksq3YnVuhadWE
 GMgI00tCFP0gCHdpi+LLb3d2vwm9+nN47ojlbFgfCG2NqP94uyA7FEQqXhOFuoYBZMID
 zFDhjZNgkRWDiEwIxX26hQLg4rW6hfvZjnLTmXNMtJlpg8e5Z7R7OJf3w2Vpnp0h3wFl
 qZWJPMgtnO4lHnLjCUYnc/b5K8jYNbAUXlLkh3f0FFjTDS0CntHd2wMs8OuzYBJ4GsAP
 F4oa+7k4Qraz+oxcqfrLL1HOJdZR43etbza2b/mxvzdjHiMkuylF0qINTt7Q1zlHOraI
 IVMg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [Question] Redundant .fig and .svg files
Message-ID: <89eb7320-04cb-af7d-1cec-38260bd7bfe0@gmail.com>
Date: Sat, 28 May 2016 09:14:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I'm doing another round of build script cleanup.
In the cleanup, I found redundant .fig and .svg files listed below.

    SMPdesign/lockdeq.fig SMPdesign/lockdeq.svg
    cartoons/patterns.fig cartoons/patterns.svg

It seems the .fig files are not used any more.
Do you mind if I remove them from the repository?

                                           Thanks, Akira

