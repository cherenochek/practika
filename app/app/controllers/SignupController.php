<?php

use Phalcon\Mvc\Controller;

class SignupController extends Controller
{
    
    public function indexAction()
    {
        
    }
    
        public function registerAction()
    {
            try{
        $user = new Users();

        //assign value from the form to $user
        $user->assign(
            $this->request->getPost(),
            [
                'login',
                'password',
                'email'
            ]
        );

        // Store and check for errors
        $success = $user->save();

        // passing the result to the view
        $this->view->success = $success;

        if ($success) {
            $message = "Thanks for registering!";
        } else {
            $message = "Sorry, the following problems were generated:<br>"
                     . implode('<br>', $user->getMessages());
        }

        // passing a message to the view
        $this->view->message = $message;
            }catch(\Exception $e){
                $message = "This login or email already exists, please enter other data.";
                $this->view->message = $message;
            }
    }
            public function signinAction()
    {
            try{
                $this->view->users = Users::find();
        $user = new Users();

        //assign value from the form to $user
        $user->assign(
            $this->request->getPost(),
            [
                'login',
                'password'
            ]
        );

        // Store and check for errors
        //$success = $user->save();

        // passing the result to the view
        $this->view->success = $success;

        
            }catch(\Exception $e){
                $message = "oops an error occured";
                $this->view->message = $message;
            }
                
                
            
    }
    public function passportAction(){
        // заполнение формы паспортных данных
                try{
        $passp = new Passport();

        //assign value from the form to $user
        $passp->assign(
            $this->request->getPost(),
            [ 
                'seria_nomber',
                'issue_by',
                'when_issue',
                'FIO'
            ]
        );

        // Store and check for errors
        $success = $passp->save();

        // passing the result to the view
        $this->view->success = $success;

        if ($success) {
            $message = "Thank you for filling out your passport details!";
        } else {
            $message = "Sorry, the following problems were generated:<br>"
                     . implode('<br>', $passp->getMessages());
        }

        // passing a message to the view
        $this->view->message = $message;
            }catch(\Exception $e){
                $message = "Error: a user with such passport data already exists.";
                $this->view->message = $message;
            }
    }
    
    
    
    public function personal_adressAction(){
        // заполнение формы паспортных данных
                try{
        $personal_adress = new personal_adress();

        //assign value from the form to $user
        $personal_adress->assign(
            $this->request->getPost(),
            [
                'country',
                'city',
                'street',
                'house',
                'apartment'
            ]
        );

        // Store and check for errors
        $success = $personal_adress->save();

        // passing the result to the view
        $this->view->success = $success;

        if ($success) {
            $message = "Thank you for filling out your passport details!";
        } else {
            $message = "Sorry, the following problems were generated:<br>"
                     . implode('<br>', $personal_adress->getMessages());
        }

        // passing a message to the view
        $this->view->message = $message;
            }catch(\Exception $e){
                $message = "Error: a user with such passport data already exists.";
                $this->view->message = $message;
            }
    }
}