Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113; h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding; bh=yRhDf6KlIbEG9ZF4+9YEyAut2HW5+4ULtM9jglsXB8A=;
 b=Xm7SPHEmq0Ivr+bObcPD+cl9s7kL5oy6kNScggbiobCNDR/TqIaVheJosHdlRw1LvX
 HuTDM6ZAAmxduIW3LMjjncblQNUVK/pOv5i/nd1pfqysoX1Qj1yfv4K2+KZkrgAo9Ztp
 YY2sUlLw0yRUEgLmDf6MJ7sCB7QERPNw7mg+BbbRwer8mI2f3Tj6wQgQS2Fs4cj1sJy2
 IJ21lHNb35PJfL0vlt7WHllVD7YB7QgsozuNtJmhFDCzJJtLQgmYXtf9Qf1benyFkU5R
 33s6YnDGZrhyGAjIuAllQbvDzvLEDSS330fNHM5OKtGgaUbSfOcv7MIf2y6PrMlc20/G HgFg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Suggestion on labels of "Pre-BSD Routing Table" scaling figures
Message-ID: <6a019120-d54f-dbe3-cfa5-1565ae27e7d3@gmail.com>
Date: Wed, 13 Jul 2016 00:32:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Thanks to your addition in Chapter 9, it is getting more and more
convincing.

However, the X-axis label in Figures 9.5, 9.9, and 9.16 is
"Number of CPUs/Threads."
At first glance, I read it as "Number of CPUs per Threads."
It took a few seconds for me to realize that it means
"Number of CPUs or Threads."

In Figure 4.10, the x-axis label is "Number of CPUs (Threads)."
I think this is better to avoid ambiguity.

What do you think?

                                                   Thanks, Akira
  

