Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=ZEA9Y4iIgBcv8Ht9e40xSL9OFD2BnWwCFBAq3BusE7Q=;
 b=BX2yxwg5ibVASt5K2jAQLASvKPyCJcpJkNFU8gs9kTNEhdSnbZIIW0Heg0VbNxUODe
 bHEZ6b/UabZaCMQnEWHvbpbVXtknWFOgxgCJuQzhK538Y9tO2b5xGzoyMkdQQfWhchcc
 KngeYU6N8mxNxLoPsMAgRnGXaFdEB8tw6CJE1hmMcNLtubd9bX6+Ibgtyqqv2wCUyarS
 Knnv25wesccynCYv9F70oWd0RLjz3UU+8Ilkm9/N0GAMvMMTborGa5am3dpAXM1E9qlx
 S1xyJS9V0g8p27iQ2Uxp0RQoM9anQYMTdgy2l6pIpeBrMcP06R3U1hsNsBxY1bwI8fI3
 iBDw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: Fix typo "baloon" -> "balloon"
Message-ID: <0b0668b6-76b8-2490-9777-1e0aa0e10280@gmail.com>
Date: Fri, 20 May 2016 00:01:59 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi, Paul.

Thank you for fixing this.
However, it breaks adjustment of "##" characters in the warning messages.
I made some improvement regarding the font installation checks.

I'm going to send the patch in reply to this message.

                                         Thanks, Akira

