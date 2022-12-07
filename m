Return-Path: <SRS0=HkZ+=4F=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sXcAnxprD3spYuhEYmECAeJcEAjORCWjYlR7yeiYe4=;
        b=eFH6eot5yz3DW2X7HRLt5t21LJyZW99s/9jwOf6+XBUt/1EIjDEbsok1UsLiCBwvts
         iVvEhkXFxd7OAPFOM5To+KooDyZgbQiGJDEvY0TwyNOwtNyW8N1ieSg0xWXAhjHR59Lz
         b48wYmdS0eYw+GNhUj3GrQdWplqnAvw5PHndd+oMeNzu0EeFPmt/NCotawLronCiQ81A
         FeKFV1qxanGeYPbWFYONT5dUhcxifylp1GAYGeRPbJ70e6BNPtQsbOQb+uaUzhobvZt4
         ifvRGWd9ox5V3XJZ7AlQZv4/XnRkDEBNYHIYpTJTMPunJqp/HIoZvcPbP9mPakTfDUxc
         dYsA==
Message-ID: <939b8f77-8d8d-bdc0-0a98-585b88f23481@gmail.com>
Date: Thu, 8 Dec 2022 08:13:11 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: LaTeX package lineno v5.0 doesn't work with perfbook
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi all,

After updating of lineno to v5.0 released on 2022/12/06,
I'm observing fatal error in building perfbook.

If you are using vanilla TeX Live 2022, please stay with v4.41
(released way back on 2005/11/02!) for the moment.

        Thanks, Akira
