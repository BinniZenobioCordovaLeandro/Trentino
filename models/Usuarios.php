<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "trentino.t_usuarios".
 *
 * @property string $dni
 * @property string $email
 * @property string $contrasegna
 * @property string $suscriptcion
 * @property bool $activo
 * @property int $id_rol
 */
class Usuarios extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'trentino.t_usuarios';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['dni', 'email', 'contrasegna', 'suscriptcion', 'id_rol'], 'required'],
            [['suscriptcion'], 'safe'],
            [['activo'], 'boolean'],
            [['id_rol'], 'default', 'value' => null],
            [['id_rol'], 'integer'],
            [['dni'], 'string', 'max' => 8],
            [['email', 'contrasegna'], 'string', 'max' => 200],
            [['email'],'email'],
            [['contrasegna'], 'string', 'min' => 15],
            [['dni'], 'unique'],
            [['id_rol'], 'exist', 'skipOnError' => true, 'targetClass' => Roles::className(), 'targetAttribute' => ['id_rol' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'dni' => 'DNI',
            'email' => 'Email',
            'contrasegna' => 'Contrasena',
            'suscriptcion' => 'Suscriptcion',
            'activo' => 'Activo',
            'id_rol' => 'Id Rol',
        ];
    }


}
